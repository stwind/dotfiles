#!/usr/bin/env PYTHONIOENCODING=UTF-8 /usr/local/bin/python3
# -*- coding: utf-8 -*-
#
# <bitbar.title>Reddit</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Parvez</bitbar.author>
# <bitbar.author.github>parvez</bitbar.author.github>
# <bitbar.desc>Displays Reddit for Mac</bitbar.desc>
# <bitbar.dependencies>python</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/parvez/bitbar-plugins</bitbar.abouturl>
#
# by Parvez

# encoding=utf8
import sys

import json
import urllib.request
from datetime import datetime

subreddits = ['Machinelearning', 'statistics', 'datascience',
              'proceduralgeneration', 'computergraphics', 'gamedev', 'webgl', 'opengl',
              'erlang', 'clojure', 'golang', 'javascript', 'typescript', 'cpp', 'rust', 'scala',
              'ableton', 'houdini', 'Cinema4D', 'blender',
              'BlockChain', 'Bitcoin', 'ethereum',
              'coding', 'programming']

def get_url(subreddit):
  return "https://www.reddit.com/r/{}.json?limit=50".format(subreddit)


def fmt_datetime(utc):
  return datetime.fromtimestamp(int(utc)).strftime('%Y/%m/%d %H:%M')


def request(url):
    request = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36",
        "Pragma": "no-cache"
    })
    return urllib.request.urlopen(request)

print ("reddit")
print ("---")
print ("Refresh... | refresh=true")
print ("---")

for subreddit in subreddits:
  print(subreddit)
  req = request(get_url(subreddit))
  body = json.loads(req.read())
  for j in body['data']['children']:
    child = j['data']
    title = child['title'] if len(child['title']) <= 70 else child['title'][:70]
    line = title + ' [' + child['domain'] + ']'
    print ("--" + line + " | href=" + child['url'] + " trim=false")
    href = "https://www.reddit.com" + child['permalink']
    line2 = "Score: " + str(child['score']) + ", Comments: " + str(child['num_comments']) + " ["  + fmt_datetime(child['created_utc']) + "]"
    print ("--          " + line2 + " | href=" + href + " trim=false size=10")
