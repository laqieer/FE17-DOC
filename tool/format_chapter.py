#!/usr/bin/env python

# Path: tool/format_chapter.py

import os
import re
import csv
from common.lang import Lang
from common.csv import read_csv

game_data = {}

def load_game_data(lang):
    game_data[lang.name] = {}
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/GameData.csv')
    for row in data:
        game_data[lang.name][row['key']] = row['text']

def format_chapter(lang, chapter):
    data = read_csv('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/' + chapter + '.csv')
    with open('docs/' + lang.name + '/' + chapter + '.txt', 'w', encoding='utf-8') as f:
        f.write('=== ' + game_data[lang.name]['MCID_' + chapter + '_PREFIX'] + ' ' + game_data[lang.name]['MCID_' + chapter] + ' ===\n\n')
        f.write('(' + game_data[lang.name]['MCID_' + chapter + '_PLACE'] + ')\n')
        if 'MCID_' + chapter + '_OUTLINE' in game_data[lang.name]:
            f.write(game_data[lang.name]['MCID_' + chapter + '_OUTLINE'] + '\n')
        texts = {}
        for row in data:
            texts[row['key']] = row['text']
        grouped_texts = {}
        for key, text in texts.items():
            group_key = key.split('#')[0]
            if group_key not in grouped_texts:
                grouped_texts[group_key] = ''
            grouped_texts[group_key] += text + '\n'
        for category in ('OP', 'ED', 'EV', 'MOVIE', 'BT', 'DIE'):
            f.write('\n--- ' + category + ' ---\n\n')
            for group_key, text in sorted(grouped_texts.items()):
                if group_key.startswith('MID_' + category):
                    f.write(text + '\n')

def main():
    for lang in Lang:
        load_game_data(lang)
        with open('docs/' + lang.name + '/chapters.md', 'w', encoding='utf-8') as f:
            for root, dirs, files in os.walk('fe_assets_message/' + lang.name[:2] + '/' + lang.name + '/csv/'):
                for file in files:
                    if re.match(r'[MS]\d{3}.csv', file):
                        chapter = file.replace('.csv', '')
                        format_chapter(lang, chapter)
                        f.write('[' + game_data[lang.name]['MCID_' + chapter + '_PREFIX'] + ' ' + game_data[lang.name]['MCID_' + chapter] + '](https://laqieer.github.io/FE17-DOC/' + lang.name + '/' + chapter + '.txt)\n\n')

if __name__ == '__main__':
    main()
