#!/usr/bin/env python

# Path: tool/format_friend_list.py

import os
import re
import csv
import warnings
import functools
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

ranks = {'D': 1, 'C': 2, 'B': 3, 'A': 4, 'S': 5}

def compare_key(kv1, kv2):
    key1, key2 = kv1['key'], kv2['key']
    matched1 = re.findall(r'^MID_FRIENDLIST_(\w+)_Text([ABCDS])$', key1)[0]
    matched2 = re.findall(r'^MID_FRIENDLIST_(\w+)_Text([ABCDS])$', key2)[0]
    friend1 = matched1[0]
    friend2 = matched2[0]
    rank1 = matched1[1]
    rank2 = matched2[1]
    if friend1 == friend2:
        if ranks[rank1] < ranks[rank2]:
            return -1
        return 1
    elif friend1 < friend2:
        return -1
    return 1

def format_friend_list(lang):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/FriendList.csv')
    data = sorted(data, key=functools.cmp_to_key(compare_key))
    with open('docs/' + lang.name + '/friend_list.txt', 'w', encoding='utf-8') as f:
        for row in data:
            matched = re.findall(r'^MID_FRIENDLIST_(\w+)_Text([ABCDS])$', row['key'])[0]
            friend = matched[0]
            name = get_name(lang, friend)
            rank = matched[1]
            if rank == 'D':
                f.write('=== ' + name + ' ===\n\n')
            f.write('--- ' + rank + ' ---\n\n')
            f.write(row['text'] + '\n\n')

def main():
    load_names()
    for lang in Lang:
        format_friend_list(lang)

if __name__ == '__main__':
    main()
