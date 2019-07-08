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
import json
import urllib.parse
import urllib.request
from bs4 import BeautifulSoup


tags = sorted(['python', 'javascript', 'typescript',
               'scala', 'GLSL', 'ディープラーニング', 'tensorflow', 'pytorch', '機械学習', '深層学習','3D','opencv',
               'machinelearning', 'deeplearning', 'webgl', 'cg', 'erlang', 'rust'])


def request(url, data):
    dataBytes = json.dumps(data).encode('utf-8')
    request = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache",
        "Content-Type": "application/json;charset=UTF-8",
        "Accept": "application/json",
        "Origin": "https://qiita.com",
        "referer": "https://qiita.com/tags/python"
    }, data=dataBytes)
    return urllib.request.urlopen(request)


def make_soup(url):
    try:
        return BeautifulSoup(request(url).read(), 'html.parser')
    except Exception as e:
        return None


def parse_item(item):
    title = item.get_text()
    href = item['href']
    return title, 'https://qiita.com{}'.format(href)


def print_tag(tag, cate):
    for i in range(1, 4):
        soup = make_soup('https://qiita.com/tags/{}/{}?page={}'.format(urllib.parse.quote(tag), cate, i))
        for item in soup.select('.tsf-ArticleBody_title'):
            title, href = parse_item(item)
            print('--{} | size=12 href={}'.format(title, href))


def run_query(query):
    data = {'query': query, "variables":{"urlName":"python","page":1,"per":10}}
    return request("https://qiita.com/graphql", data)


if __name__ == '__main__':
    query = """query getTagArticles($urlName: String!, $page: Int!, $per: Int!) {
  tag(urlName: $urlName) {
    ...TagArticles
  }
}

fragment TagArticles on Tag {
  articles(page: $page, per: $per) {
    items {
      ...TagArticlesItems
    }
    pageData {
      ...TagArticlesPageData
    }
  }
}

fragment TagArticlesItems on Article {
  createdAt
  uuid
  title
  likesCount
  author {
    profileImageUrl
    urlName
  }
  tags {
    name
    urlName
  }
}

fragment TagArticlesPageData on PageData {
  currentPage
  isFirstPage
  isLastPage
  nextPage
  prevPage
  totalPages
} """
    print(run_query("query getTagArticles($urlName: String!, $page: Int!, $per: Int!) {\n  tag(urlName: $urlName) {\n    ...TagArticles\n  }\n}\n\nfragment TagArticles on Tag {\n  articles(page: $page, per: $per) {\n    items {\n      ...TagArticlesItems\n    }\n    pageData {\n      ...TagArticlesPageData\n    }\n  }\n}\n\nfragment TagArticlesItems on Article {\n  createdAt\n  uuid\n  title\n  likesCount\n  author {\n    profileImageUrl\n    urlName\n  }\n  tags {\n    name\n    urlName\n  }\n}\n\nfragment TagArticlesPageData on PageData {\n  currentPage\n  isFirstPage\n  isLastPage\n  nextPage\n  prevPage\n  totalPages\n}\n"))

    # print("qiita")
    # print("---")
    # print("Refresh... | refresh=true")
    # print("---")
    # for tag in tags:
    #     print(tag)
    #     print_tag(tag, 'items')
        # print_tag(tag, 'likes')
