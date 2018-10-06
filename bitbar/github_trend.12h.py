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

import urllib.request
from bs4 import BeautifulSoup

langs = sorted(['clojure', 'erlang', 'c', 'cpp', 'python', 'javascript', 'typescript', 'css',
                'go', 'rust', 'WebAssembly', 'scala', 'haskell', 'ocaml', 'shell',
                'swift', 'max', 'glsl', 'mathematica', 'java'])
sinces = ['daily', 'weekly', 'monthly']

topics = sorted(['3d', '3d-graphics', 'graphics', 'webgl', 'webgl2', 'opengl', 'vulkan', 'shaders', 'computer-graphics', 'cad',
                 'glsl', 'gpu', 'math', 'creative-coding', 'computational-geometry',
                 'algorithm', 'graph', 'dataset', 'machine-learning', 'deep-learning', 'neural-network',
                 'streaming', 'data',
                 'actor-model', 'actors', 'distributed-systems', 'reactive', 'clustering', 'csp', 'concurrency',
                 'blockchain', 'bitcoin', 'cryptocurrency', 'webassembly',
                 'webaudio', 'audio', 'sound', 'video', 'music', 'electron',
                 'security', 'security-tools', 'docker', 'kubernetes', 'devops', 'functional',
                 'fbp', 'dataflow', 'workflow', 'bpmn', 'bpm', 'database',
                 'statistics', 'quant', 'finance', 'trading', 'analytics', 'time-series',
                 'visualization', 'data-visualization', 'ui', 'gui', 'awesome', 'specification',
                 'semantic-web', 'rdf', 'ontology', 'semantic',
                 'command-line', 'cli', 'interactive', 'geospatial', 'gis', 'proxy',
                 'sketch-plugin', 'sketch'])


def get_trend_url(lang, since):
    return "https://github.com/trending/{}?since={}".format(lang, since)


def get_topic_url(topic):
    return "https://github.com/topics/{}".format(topic)


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


def parse_trend(repo):
    h3 = repo.find('h3')
    name = h3.get_text().strip()
    href = h3.find('a')['href']
    url = "https://github.com{}".format(href)
    p = repo.find('p')
    desc = p.get_text().strip().replace('|', '\\') if p else ''
    return name, url, desc


def parse_topic(article):
    divs = article.find_all('div')
    h3 = divs[0].find('h3')
    name = h3.get_text().strip()
    href = h3.find('a')['href']
    url = "https://github.com{}".format(href)
    desc = divs[1].get_text().strip().replace('|', '\\')
    return name, url, desc


if __name__ == '__main__':
    print("gt")
    print("---")
    print("Refresh... | refresh=true")
    print("---")

    print('languages')
    for lang in langs:
        print("--" + lang)
        for since in sinces:
            print('----' + since)
            soup = make_soup(get_trend_url(lang, since))
            if soup:
                for repo in soup.select('ol.repo-list li'):
                    name, url, desc = parse_trend(repo)
                    print("----[" + name + "] " + desc + " | size=12 href=" + url)
            else:
                print("----failed")

    print("topics")
    for topic in topics:
        print("--" + topic)
        soup = make_soup(get_topic_url(topic))
        if soup:
            for article in soup.select('.topic article'):
                name, url, desc = parse_topic(article)
                print("----[" + name + "] " + desc + " | size=12 href=" + url)
        else:
            print("----failed")
