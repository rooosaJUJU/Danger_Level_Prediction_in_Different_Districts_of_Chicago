#!/usr/bin/env python

import sys

wordcount={}

for line in sys.stdin:
  word, count = line.strip().split('\t')

  try:
    count=int(count)
  except ValueError:
    continue
  try:
    wordcount[word]=wordcount[word] + count
  except:
    wordcount[word]=count

for word in wordcount.keys():
  print '%s\t%s' %(word, wordcount[word])
