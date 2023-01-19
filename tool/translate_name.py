#!/usr/bin/env python

# Path: tool/translate_name.py

import os
import re
import csv
import warnings
from common.lang import Lang
from common.csv import read_csv

def load_names(category):
    names = {}
    for lang in Lang:
        data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/' + category + '.csv')
        for row in data:
            matched = re.findall(r'^M[PJIS]ID_([a-zA-Z0-9]+)$', row['key'])
            if matched:
                if matched[0] not in names:
                    names[matched[0]] = {}
                text = row['text']
                if text.startswith('['):
                    text = text[1:]
                if text.endswith(']'):
                    text = text[:-1]
                names[matched[0]][lang.name] = text
    return names

def write_names(category, names):
    with open('translations/' + category + '.csv', 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f)
        writer.writerow(['key', Lang.usen.name, Lang.jpja.name, Lang.cnch.name])
        for key, value in sorted(names.items()):
            writer.writerow([key, value[Lang.usen.name], value[Lang.jpja.name], value[Lang.cnch.name]])

def main():
    for category in ['Person', 'Job', 'Item', 'Skill']:
        write_names(category, load_names(category))

if __name__ == '__main__':
    main()
