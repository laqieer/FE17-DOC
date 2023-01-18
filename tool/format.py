#!/usr/bin/env python

# Path: tool/format.py

import os
import re
import csv
import enum

names = {}

class Lang(enum.Enum):
    jpja = 1
    usen = 2
    cnch = 3

def read_csv(filename):
    with open(filename, 'r') as f:
        reader = csv.DictReader(f)
        return list(reader)

def load_names():
    data = read_csv('fee-translations/fee-translations-v0.csv')
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
                        word = word.replace('M000_', '')
                        if word in names:
                            word = names[word][lang]
                            word = '[' + word + ']'
                        texts[key] += word + ' '
                texts[key] += '\n'
    for key, text in texts.items():
        texts[key] = text.strip()
    return texts

def write_csv(filename, texts):
    with open(filename, 'w', encoding='utf-8-sig') as f:
        writer = csv.writer(f)
        writer.writerow(['key', 'text'])
        for key, text in sorted(texts.items()):
            writer.writerow([key, text])

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
