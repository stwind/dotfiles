#!/usr/local/bin/python3
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

langs = sorted(['clojure', 'erlang', 'c', 'c++', 'python', 'javascript', 'typescript', 'css',
                'go', 'rust', 'WebAssembly', 'scala', 'haskell', 'ocaml', 'shell', 'jupyter-notebook',
                'swift', 'max', 'glsl', 'mathematica', 'java'])
sinces = ['daily', 'weekly', 'monthly']

topics = sorted(['3d', '3d-graphics', 'graphics', 'webgl', 'webgl2', 'opengl', 'vulkan', 'shaders', 'computer-graphics', 'cad',
                 'glsl', 'gpu', 'math', 'creative-coding', 'computational-geometry', 'csg', 'geometry', 'shaders',
                 'computer-vision',
                 'procedural', 'procedural-generation', 'generative', 'generative-art', 'gpgpu',
                 'algorithm', 'graph', 'dataset', 'machine-learning', 'deep-learning', 'neural-network',
                 'streaming', 'data',
                 'actor-model', 'actors', 'distributed-systems', 'reactive', 'clustering', 'csp', 'concurrency',
                 'blockchain', 'bitcoin', 'cryptocurrency', 'webassembly',
                 'webaudio', 'audio', 'sound', 'video', 'music', 'electron',
                 'security', 'security-tools', 'docker', 'kubernetes', 'devops', 'functional',
                 'fbp', 'dataflow', 'workflow', 'bpmn', 'bpm', 'database',
                 'statistics', 'quant', 'finance', 'trading', 'analytics', 'time-series',
                 'visualization', 'data-visualization', 'ui', 'gui', 'awesome', 'specification',
                 'semantic-web', 'rdf', 'ontology', 'semantic', 'serverless',
                 'command-line', 'cli', 'interactive', 'geospatial', 'gis', 'proxy',
                 'sketch-plugin', 'sketch'])


def get_trend_url(lang, since):
    return "https://github.com/trending/{}?since={}&spoken_language_code=en".format(lang, since)


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
    h1 = repo.find('h1')
    name = h1.get_text().strip()
    href = h1.find('a')['href']
    url = "https://github.com{}".format(href)
    p = repo.find('p')
    desc = p.get_text().strip().replace('|', '\\') if p else ''
    return name, url, desc


def parse_topic(article):
    divs = article.find_all('div')
    h3a = divs[0].select_one('h3 a')
    name = h3a.get_text().strip()
    href = h3a['href']
    url = "https://github.com{}".format(href)
    desc = divs[1].get_text().strip().replace('|', '\\')
    return name, url, desc


def print_entry(name, url, desc):
    name = " ".join(name.replace('\n', '').split())
    print("----[{}] {} | size=12 href={}".format(name, desc, url))


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
                for repo in soup.select('.Box-row'):
                    name, url, desc = parse_trend(repo)
                    print_entry(name, url, desc)
            else:
                print("----failed")

    # print("topics")
    # for topic in topics:
    #     print("--" + topic)
    #     soup = make_soup(get_topic_url(topic))
    #     if soup:
    #         for article in soup.select('article.border-bottom.border-gray-light.py-4'):
    #             name, url, desc = parse_topic(article)
    #             print_entry(name, url, desc)
    #     else:
    #         print("----failed")
