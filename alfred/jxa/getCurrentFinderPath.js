#!/usr/bin/env osascript -l JavaScript

var finder = Application('Finder');
var url = finder.selection()[0].url();

decodeURI(url.replace("file://", ""));
