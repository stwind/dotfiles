#!/usr/bin/python
# encoding: utf-8

import sys
import argparse
import json


def main(opts, args):
    vars_args = dict(zip(opts.names, args)) if opts.names else {}
    alfred = {'alfredworkflow': {'arg': '', 'variables': vars_args}}
    sys.stdout.write(json.dumps(alfred))
    return 0


def parse_opts():
    parser = argparse.ArgumentParser()
    parser.add_argument('--names', nargs='*')
    opts, rest = parser.parse_known_args()
    return (opts, rest)

if __name__ == '__main__':
    opts, rest = parse_opts()
    sys.exit(main(opts, rest))
