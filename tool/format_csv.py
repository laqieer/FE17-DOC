#!/usr/bin/env python

# Path: tool/format_csv.py

import os
import re
from common.lang import Lang
from common.csv import read_csv, write_csv

names = {}

def load_names():
    data = read_csv('translations/fee-translations.csv', encoding='utf-8')
    for name in data:
        names[name[Lang.jpja.name]] = name

def read_xmsbt(filename):
    texts = {}
    lang = re.findall(r'/\w{2}/(\w{4})/', filename)[0]
    with open(filename, 'r', encoding='utf-16') as f:
        key = ''
        for line in f.readlines():
            matched = re.findall(r'<entry label="(\S+?)">', line)
            if matched:
                key = matched[0]
                texts[key] = ''
                continue
            if key:
                line = line.strip()
                line = re.sub(r'<\S+?>', ' ', line)
                line = re.sub(r'</\S+?>', ' ', line)
                line = re.sub(r'&#x\w+?;', ' ', line)
                line = line.replace('\\0', '')
                words = line.split(' ')
                for word in words:
                    if word:
                        word = re.sub(r'[MS]\d{3}_', '', word)
                        for w in word.split('_'):
                            if w in names:
                                w = names[w][lang]
                                w = '[' + w + ']'
                            texts[key] += w + ' '
                texts[key] += '\n'
    for key, text in texts.items():
        texts[key] = text.strip()
    return texts

def main():
    load_names()
    for lang in Lang:
        folder = 'fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/xmsbt/'
        for root, dirs, files in os.walk(folder):
            for file in files:
                if file.endswith('.xmsbt'):
                    path = os.path.join(root, file)
                    write_csv(path.replace('xmsbt', 'csv'), read_xmsbt(path))

if __name__ == '__main__':
    main()
