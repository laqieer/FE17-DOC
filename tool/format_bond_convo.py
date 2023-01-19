#!/usr/bin/env python

# Path: tool/format_bond_convo.py

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

def format_bond_convo(lang, filename):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/' + filename)
    data = sorted(data, key=lambda x: x['key']) # sort by key
    with open('docs/' + lang.name + '/' + filename.replace('.csv', '.txt'), 'w', encoding='utf-8') as f:
        god = re.findall(r'^GR_(\w+).csv$', filename)[0]
        texts = {}
        for row in data:
            matched = re.findall(r'^MID_GR_(\w+)_([ABC])_#\d{3}$', row['key'])[0]
            person = matched[0]
            rank = matched[1]
            if person not in texts:
                texts[person] = {}
            if rank not in texts[person]:
                texts[person][rank] = ''
            texts[person][rank] += row['text'] + '\n'
        for person in texts:
            f.write('=== ' + get_name(lang, god) + ' & ' + get_name(lang, person) + ' ===\n\n')
            for rank in ('C', 'B', 'A'):
                f.write('--- ' + rank + ' ---\n\n')
                f.write(texts[person][rank] + '\n')

def main():
    load_names()
    for lang in Lang:
        with open('docs/' + lang.name + '/bond_convo.md', 'w', encoding='utf-8') as f:
            for root, dirs, files in os.walk('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv'):
                for filename in files:
                    if re.match(r'^GR_\w+.csv$', filename):
                        format_bond_convo(lang, filename)
                        matched = re.findall(r'^GR_(\w+).csv$', filename)
                        f.write('[' + get_name(lang, matched[0]) + '](https://laqieer.github.io/FE17-DOC/' + lang.name + '/' + filename.replace('.csv', '.txt') + ')\n')

if __name__ == '__main__':
    main()
