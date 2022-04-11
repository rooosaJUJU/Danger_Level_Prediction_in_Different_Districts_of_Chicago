#!/usr/bin/env python

import sys

arrtal = {}
arrcount = {}

D_arrest = {'true':1.0,'false':0.0}

L_district = ['001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017', \
'018','019','020','022','024','025','031']

for line in sys.stdin:

  line = line.strip().split('\t')

  if len(line) == 2:
    district = line[0]
    arrest = line[1]
  else:
    continue

  if district not in L_district:
    continue
  if arrest not in D_arrest:
    continue

  try:
    arrtal[district] += D_arrest[arrest]
  except:
    arrtal[district] = D_arrest[arrest]
  try:
    arrcount[district] += 1
  except:
    arrcount[district] = 1


for district in arrtal:
  print '%s,%s' % (district, float(arrtal[district]/arrcount[district]))
