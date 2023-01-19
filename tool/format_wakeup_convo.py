#!/usr/bin/env python

# Path: tool/format_wakeup_convo.py

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

def format_wakeup_convo(lang, filename):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/' + filename)
    data = sorted(data, key=lambda x: x['key']) # sort by key
    with open('docs/' + lang.name + '/' + filename.replace('.csv', '.txt'), 'w', encoding='utf-8') as f:
        caller = re.findall(r'^WakeUp_(\w+).csv$', filename)[0]
        f.write('=== ' + get_name(lang, caller) + ' ===\n\n')
        texts = {}
        for row in data:
            matched = re.findall(r'^MID_WU_([ABCS])_([12])_(\w+?)_#\d{3}$', row['key'])[0]
            rank = matched[0] + matched[1]
            category = matched[2]
            if rank not in texts:
                texts[rank] = {}
            if category not in texts[rank]:
                texts[rank][category] = ''
            texts[rank][category] += row['text'] + '\n'
        for rank in ('C1', 'C2', 'B1', 'B2', 'A1', 'A2', 'S1', 'S2'):
            f.write('--- ' + rank + ' ---\n\n')
            for category in ('IN', 'WAKEUP', 'HELLO', 'SOON'): # 进房间->叫醒->早安->拜拜
                f.write(texts[rank][category] + '\n\n')

def main():
    load_names()
    for lang in Lang:
        with open('docs/' + lang.name + '/wakeup_convo.md', 'w', encoding='utf-8') as f:
            for root, dirs, files in os.walk('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv'):
                for filename in files:
                    if re.match(r'^WakeUp_\w+.csv$', filename):
                        format_wakeup_convo(lang, filename)
                        matched = re.findall(r'^WakeUp_(\w+).csv$', filename)
                        f.write('[' + get_name(lang, matched[0]) + '](https://laqieer.github.io/FE17-DOC/' + lang.name + '/' + filename.replace('.csv', '.txt') + ')\n')

if __name__ == '__main__':
    main()
