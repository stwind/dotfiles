#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# <bitbar.title>echojs</bitbar.title>
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


def parse_link(a):
    title = a.get_text()
    href = a.get('href')
    if not href.startswith('http'):
        href = "http://www.echojs.com{}".format(href)
    return title, href


if __name__ == '__main__':
    print("echojs")
    print("---")
    print("Refresh... | refresh=true")
    print("---")
    print("top")
    soup = make_soup("http://www.echojs.com/")
    for a in soup.select('section#newslist article h2 a'):
        title, url = parse_link(a)
        print("--" + title + " | size=12 href=" + url)
    print("new")
    for p in [x * 30 for x in range(0, 2)]:
        soup = make_soup("http://www.echojs.com/latest/{}".format(p))
        for a in soup.select('section#newslist article h2 a'):
            title, url = parse_link(a)
            print("--" + title + " | size=12 href=" + url)
