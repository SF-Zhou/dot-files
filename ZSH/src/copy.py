#!/usr/local/bin/python3
from pyperclip import copy

lines = []
while True:
    try:
        line = input()
        lines.append(line)
    except EOFError:
        break
result = '\n'.join(lines)
copy(result)
