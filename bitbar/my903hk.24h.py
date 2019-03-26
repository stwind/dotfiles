#!/usr/bin/env PYTHONIOENCODING=UTF-8 /usr/local/bin/python3
# -*- coding: utf-8 -*-
#
# <bitbar.title>Qiita</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>stwind</bitbar.author>
# <bitbar.author.github>stwind</bitbar.author.github>
# <bitbar.desc>Display qiita</bitbar.desc>
# <bitbar.dependencies>python</bitbar.dependencies>

# encoding=utf8

import sys

import urllib.parse
import urllib.request
from bs4 import BeautifulSoup


def request(url):
    request = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return urllib.request.urlopen(request)


def make_soup(url):
    try:
        return BeautifulSoup(request(url).read(), 'html.parser')
    except Exception as e:
        return None


if __name__ == '__main__':
    print("903")
    print("---")
    print("Refresh... | refresh=true")
    print("---")
    for i in range(1, 2):
        soup = make_soup('http://www.my903hk.tk/page/{}'.format(i))
        for post in soup.select('.post'):
            title_a = post.select_one('.entry-title a')
            title = title_a.get_text()
            mlsp = make_soup(title_a['href'])
            url = mlsp.select_one('.wp-audio-shortcode a')
            if url:
                print(title + '| size=12 href=' + url['href'])
