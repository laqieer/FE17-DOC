#!/usr/bin/env python

# Path: tool/format_support_convo.py

import os
import re
import csv
import warnings
from common.lang import Lang
from common.csv import read_csv

names = {}

def load_names():
    data = read_csv('translations/Person.csv', encoding='utf-8-sig')
    for name in data:
        names[name['key']] = name

def get_name(lang, name):
    if name in names:
        return names[name][lang.name]
    else:
        warnings.warn('Unknown name: ' + name)
        return name

def format_support_convo(lang, filename):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/' + filename)
    with open('docs/' + lang.name + '/' + filename.replace('.csv', '.txt'), 'w', encoding='utf-8') as f:
        matched = re.findall(r'^R_(\w+)_(\w+).csv$', filename)[0]
        f.write('=== ' + get_name(lang, matched[0]) + ' & ' + get_name(lang, matched[1]) + ' ===\n')
        for rank in ('C', 'B', 'A', 'S'):
            f.write('--- ' + rank + ' ---\n')
            for row in sorted(data, key=lambda x: x['key']): # sort by key
                if row['key'].startswith('MID_RELIANCE_' + rank + '_'):
                    f.write(row['text'] + '\n')

def main():
    load_names()
    for lang in Lang:
        with open('docs/' + lang.name + '/support_convo.md', 'w', encoding='utf-8') as f:
            for root, dirs, files in os.walk('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv'):
                for filename in files:
                    if re.match(r'^R_\w+_\w+.csv$', filename):
                        format_support_convo(lang, filename)
                        matched = re.findall(r'^R_(\w+)_(\w+).csv$', filename)[0]
                        f.write('[' + get_name(lang, matched[0]) + ' & ' + get_name(lang, matched[1]) + '](https://laqieer.github.io/FE17-DOC/' + lang.name + '/' + filename.replace('.csv', '.txt') + ')\n')

if __name__ == '__main__':
    main()
