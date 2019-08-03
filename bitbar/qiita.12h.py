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
import codecs
import json
import urllib.parse
import urllib.request
from urllib.request import ProxyHandler, build_opener, Request
from bs4 import BeautifulSoup


tags = sorted(['python', 'javascript', 'typescript', "cpp", "c", "webassembly",'houdini','touchdesigner',
               'scala', 'GLSL', 'ディープラーニング', 'tensorflow', 'pytorch', '機械学習', '深層学習','3D','opencv',
               'machinelearning', 'deeplearning', 'webgl', 'cg', 'erlang', 'rust'])

QUERY = """
query getTagArticles($urlName: String!, $page: Int!, $per: Int!) {
  tag(urlName: $urlName) {
    ...TagArticles
  }
}

fragment TagArticles on Tag {
  articles(page: $page, per: $per) {
    items {
      ...TagArticlesItems
    }
  }
}

fragment TagArticlesItems on Article {
  createdAt
  uuid
  title
  author {
    urlName
  }
}
"""


def get_opener():
    proxy = '127.0.0.1:1235'
    proxy_handler = ProxyHandler({
        'http': 'http://' + proxy,
        'https': 'https://' + proxy
    })
    return build_opener(proxy_handler)


opener = get_opener()


def request(url, tag,  data):
    dataBytes = json.dumps(data).encode('utf-8')
    request = Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache",
        "Content-Type": "application/json;charset=UTF-8",
        "Accept": "application/json",
        "Origin": "https://qiita.com",
        "referer": "https://qiita.com/tags/{}".format(urllib.parse.quote(tag).lower()),
        "Cookie": "_qiita_login_session=UlVFZnRBNy9LK2Q3YUo4SmxpTzdlbURFRjVEVlk2VzNSTE1GbDFlSngyTEplVHMydmgvZnIxWWNzYllKeTRqVmdLMlV0S3RVTkJqN0dXWUZhRHJnRkNCQ2pmYm5YNnFtNG8wbXdsU1c0ZzdCUVRFRTV0VDlQR3EwTndkMTdzRFBObHI3YXhzRlAvYXdWdlBkWWVhd3Vpb1Y2YUpycUdQUkF1Vml6NzVXZG1TYWd1NXpkNDdQUmR4aXpXS0JONEtQLS1zc0JLSG80NUtBc2JwMm8xdnZmK3ZBPT0%3D--1308176661ea144bbe650811108e22b074e3e9fa",
        "X-CSRF-Token": "PAImJayuPs5vbVXblad4yRwpe5Ut2LawlzGYx5qjebrRBzA8JGu5FrdJ60c6qxwDg4PXUcc4WSZAKc44y65p5g=="
    }, data=dataBytes)
    return opener.open(request)


def run_query(tag):
    data = {'query': QUERY, "variables":{"urlName":urllib.parse.quote(tag).lower(),"page":1,"per":80}}
    resp = request("https://qiita.com/graphql", tag, data)
    reader = codecs.getreader("utf-8")
    return json.load(reader(resp))


def print_tag(tag):
    data = run_query(tag)
    for item in data['data']['tag']['articles']['items']:
        href = "https://qiita.com/{}/items/{}".format(item["author"]["urlName"],item["uuid"])
        print('--{} | size=12 href={}'.format(item["title"], href))


if __name__ == '__main__':
    print("qiita")
    print("---")
    print("Refresh... | refresh=true")
    print("---")
    for tag in tags:
        print(tag)
        print_tag(tag)
