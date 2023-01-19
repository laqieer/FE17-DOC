import csv

def read_csv(filename, encoding='utf-8-sig'):
    with open(filename, 'r', encoding=encoding) as f:
        reader = csv.DictReader(f)
        return list(reader)

def write_csv(filename, texts):
    with open(filename, 'w', encoding='utf-8-sig') as f:
        writer = csv.writer(f)
        writer.writerow(['key', 'text'])
        for key, text in sorted(texts.items()):
            writer.writerow([key, text])
