#!/usr/bin/env osascript -l JavaScript

var chrome = Application('Google Chrome');

if (chrome.running()) {
  var url = chrome.windows[0].activeTab.url();
  var name = chrome.windows[0].activeTab.name();
  JSON.stringify({
    "alfredworkflow": {
      arg: url,
      variables: { url, name }
    }
  });
}
