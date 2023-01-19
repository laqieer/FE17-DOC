#!/usr/bin/env python

# Path: tool/format_die.py

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

def format_die(lang):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/Die.csv')
    with open('docs/' + lang.name + '/die.txt', 'w', encoding='utf-8') as f:
        for row in data:
            name = re.findall(r'^MID_DIE_(\w+)$', row['key'])[0]
            if '_' in name:
                prefix, name = name.split('_', 1)
                if prefix == 'Lueur':
                    name = get_name(lang, prefix) + ' & ' + get_name(lang, name)
                else:
                    name = get_name(lang, name) + ' (' + prefix + ')'
            else:
                name = get_name(lang, name)
            f.write('=== ' + name + ' ===\n')
            f.write(row['text'] + '\n\n')

def main():
    load_names()
    for lang in Lang:
        format_die(lang)

if __name__ == '__main__':
    main()
