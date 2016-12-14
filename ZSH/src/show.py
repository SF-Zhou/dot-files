#!/usr/local/bin/python3
import sys

lines = []
while True:
    try:
        line = input()
        lines.append(line)
    except EOFError:
        break
result = '\n'.join(lines)
print(result, file=sys.stderr)
print(result)
