#!/usr/bin/env python3
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

# import urllib.request
from urllib.request import build_opener, ProxyHandler, Request
from bs4 import BeautifulSoup


PROXY = '127.0.0.1:1235'

opener = build_opener(ProxyHandler({
    'http': 'http://' + PROXY,
    'https': 'https://' + PROXY
}))


def request(url):
    request = Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return opener.open(request)


def make_soup(url):
    return BeautifulSoup(request(url).read(), 'html.parser')


def comment_link(tid):
    return "https://news.ycombinator.com/item?id={}".format(tid)


def parse_thing(thing):
    comment_link = thing.find_next_sibling()
    tid = thing.get('id')
    link = thing.find('a',class_='storylink')
    href = link.get('href')
    if not href.startswith('http'):
        href = "https://news.ycombinator.com/{}".format(href)
    title = link.get_text()
    return title, href, tid, comment_link.get_text().strip()


def print_results(soup):
    for thing in soup.select('.athing'):
        title, href, tid, desc = parse_thing(thing)
        print("--" + title + " | href=" + href + " trim=false")
        print("--          " + desc.replace("|","") + " | href=" + comment_link(tid) + " trim=false size=10")


if __name__ == '__main__':
    print("hn")
    print("---")
    print("Refresh... | refresh=true")
    print("---")
    for cate in ['news', 'best']:
        print(cate)
        for p in range(1, 3):
            soup = make_soup("https://news.ycombinator.com/{}?p={}".format(cate, p))
            print_results(soup)
