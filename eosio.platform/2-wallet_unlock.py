#!/usr/bin/python3
import sys
import os

for line in open('walt_pin'):
    l = line.strip().split(',')
    os.system('cleos wallet unlock -n ' + l[0] + ' --password ' + l[1])

