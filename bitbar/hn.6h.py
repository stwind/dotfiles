#!/usr/bin/env PYTHONIOENCODING=UTF-8 /usr/local/bin/python
# -*- coding: utf-8 -*-
#
# <bitbar.title>Hackernews</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>stwind</bitbar.author>
# <bitbar.author.github>stwind</bitbar.author.github>
# <bitbar.desc>Display github trends</bitbar.desc>
# <bitbar.dependencies>python</bitbar.dependencies>

# encoding=utf8
import sys

import urllib.request
from bs4 import BeautifulSoup


def request(url):
    request = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return urllib.request.urlopen(request)


def make_soup(url):
    return BeautifulSoup(request(url).read(), 'html.parser')


def comment_link(tid):
    return "https://news.ycombinator.com/item?id={}".format(tid)


def parse_thing(thing):
    comment_link = thing.find_next_sibling()
    tid = thing.get('id')
    link = thing.find('a',class_='storylink')
    href = link.get('href')
    title = link.get_text()
    return title, href, tid, comment_link.get_text().strip()


if __name__ == '__main__':
    print("hn")
    print("---")
    print("new")
    soup = make_soup("https://news.ycombinator.com/")
    for thing in soup.select('.athing'):
        title, href, tid, desc = parse_thing(thing)
        print("--" + title + " | href=" + href + " trim=false")
        print("--          " + desc.replace("|","") + " | href=" + comment_link(tid) + " trim=false size=10")
    print("best")
    soup = make_soup("https://news.ycombinator.com/best")
    for thing in soup.select('.athing'):
        title, href, tid, desc = parse_thing(thing)
        print("--" + title + " | href=" + href + " trim=false")
        print("--          " + desc.replace("|","") + " | href=" + comment_link(tid) + " trim=false size=10")
    print("---")
    print("Refresh... | refresh=true")
