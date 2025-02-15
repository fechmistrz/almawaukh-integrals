#!/usr/bin/env python3

import sys

printing = True
if len(sys.argv) >= 3:
    printing = sys.argv[2] != "solutions"

with open(sys.argv[1]) as f:
    for line in f:
        if printing and "% SOLUTION" not in line:
            print(line, end="")
        if "% SOLUTION" in line:
            printing = not printing
            print("")