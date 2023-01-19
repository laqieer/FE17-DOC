#!/usr/bin/env python

# Path: tool/format_after.py

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

def format_after(lang):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/After.csv')
    with open('docs/' + lang.name + '/after.txt', 'w', encoding='utf-8') as f:
        for row in data:
            name = re.findall(r'^MID_AFTER_(\w+)_(\w+)$', row['key'])[0]
            if name[0] == 'Lost': # 于xxx战败
                continue
            if name[1] == 'Text': # 单人结局
                f.write('=== ' + get_name(lang, name[0]) + ' ===\n')
            else: # 双人结局
                f.write('=== ' + get_name(lang, name[0]) + ' & ' + get_name(lang, name[1]) + ' ===\n')
            #TODO: name[1] == 'Pair' for MID_AFTER_Lueur_Pair
            f.write(row['text'] + '\n\n')

def main():
    load_names()
    for lang in Lang:
        format_after(lang)

if __name__ == '__main__':
    main()
