#!/usr/local/bin/python2
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
reload(sys)
sys.setdefaultencoding('utf8')

import json
import urllib2
from bs4 import BeautifulSoup

langs = ['clojure', 'erlang', 'cpp', 'python', 'javascript', 'go', 'rust']
sinces = ['daily', 'weekly', 'monthly']

def get_url(lang, since):
    return "https://github.com/trending/{}?since={}".format(lang, since)


def request(url):
    request = urllib2.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return urllib2.urlopen(request)


def parse_repo(repo):
    h3 = repo.find('h3')
    name = h3.get_text().strip()
    href = h3.find('a')['href']
    url = "https://github.com{}".format(href)
    p = repo.find('p')
    desc = p.get_text().strip() if p else ''
    return name, url, desc


if __name__ == '__main__':
    print ("gt")
    print ("---")
    for lang in langs:
        print(lang)
        for since in sinces:
            print("--" + since)
            req = request(get_url(lang, since))
            if req.getcode() == 200:
                soup = BeautifulSoup(req.read(), 'html.parser')
                for repo in soup.select('ol.repo-list li'):
                    name, url, desc = parse_repo(repo)
                    desc = desc.replace('|', '\\')
                    print("----[" + name + "] " + desc + " | href=" + url)
            else:
                print("--failed")
    print ("---")
    print ("Refresh... | refresh=true")
