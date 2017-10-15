#!/usr/bin/python
# encoding: utf-8

import os
import sys
import argparse
import time
import json

sys.path.insert(0, './lib')

from utils import quiver


def main(opts):
    notebook, _ = quiver.ensure_notebook(opts.lib, opts.notebook)
    note, _ = quiver.ensure_note(notebook, opts.note)
    content = quiver.get_note(note)
    content = quiver.add_cell(content, opts.data)
    quiver.write_note(content, note)
    return 0


def default_quiver_lib():
    path = "~/Library/Containers/com.happenapps.Quiver/Data/Library/Application Support/Quiver/Quiver.qvlibrary"
    return os.path.expanduser(path)


def default_note():
    return time.strftime("%Y-%m-%d")


def parse_opts():
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', '--lib', default=default_quiver_lib())
    parser.add_argument('-t', '--type', default="markdown")
    parser.add_argument('--notebook', default="reading")
    parser.add_argument('--note', default=default_note())
    parser.add_argument('data')
    opts, _ = parser.parse_known_args()
    return opts

if __name__ == '__main__':
    opts = parse_opts()
    sys.exit(main(opts))
