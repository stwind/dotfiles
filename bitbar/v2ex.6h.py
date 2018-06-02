#!/usr/bin/env PYTHONIOENCODING=UTF-8 /usr/local/bin/python3
# -*- coding: utf-8 -*-
#
# <bitbar.title>Github trend</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>stwind</bitbar.author>
# <bitbar.author.github>stwind</bitbar.author.github>
# <bitbar.desc>Display github trends</bitbar.desc>
# <bitbar.dependencies>python</bitbar.dependencies>

# encoding=utf8
import sys

import json
import urllib.request
from bs4 import BeautifulSoup


nodes = ['jobs','programmer', 'qna']

def get_url(node, page):
    return "https://www.v2ex.com/go/{}?p={}".format(node, page)


def request(url):
    req = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return urllib.request.urlopen(req)


def parse_cell(cell):
    item_title = cell.select_one('.item_title a')
    title = item_title.get_text().replace('\n', ' ').replace('\r', ' ').strip()
    url = item_title['href']
    return title, "https://www.v2ex.com{}".format(url)


if __name__ == '__main__':
    print ("v2ex")
    print ("---")
    print ("Refresh... | refresh=true")
    print ("---")
    for node in nodes:
        print(node)
        for page in range(1, 3+1):
            req = request(get_url(node, page))
            if req.getcode() == 200:
                soup = BeautifulSoup(req.read(), 'html.parser')
                for cell in soup.select('#TopicsNode .cell'):
                    title, url = parse_cell(cell)
                    print("--" + title + "| size=12 href=" + url)
            else:
                print("--failed")
