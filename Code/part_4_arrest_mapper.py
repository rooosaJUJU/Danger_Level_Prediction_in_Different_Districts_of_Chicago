#!/usr/bin/env python

import sys

L_arrest = ['Arrest','true','false']

L_district = ['District','001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017',\
'018','019','020','022','024','025','031']

for line in sys.stdin:

  line = line.strip().split(",")

  i = 7
  j = 10

  arrest = line[i]
  district = line[j]

  while arrest not in L_arrest:
    i += 1
    if i >= len(line):
      break
    arrest = line[i]

  while district not in L_district:
    j += 1
    if j >= len(line):
      break
    district = line[j]

  print '%s\t%s' % (district, arrest)
