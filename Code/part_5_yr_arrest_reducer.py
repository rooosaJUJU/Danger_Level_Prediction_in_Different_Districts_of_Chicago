#!/usr/bin/env python

import sys

arrtal = {}
arrcount = {}

D_arrest = {'true':1.0,'false':0.0}
L_district = ['001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017', \
'018','019','020','022','024','025','031']

L_year = ['2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014',\
'2015','2016','2017','2018','2019','2020']

for line in sys.stdin:

  line = line.strip().split('\t')

  if len(line) == 3:
    year = line[0]
    district = line[1]
    arrest = line[2]
  else:
    continue

  if year not in L_year:
    continue
  if district not in L_district:
    continue
  if arrest not in D_arrest:
    continue

  year = int(year)

  try:
    arrtal[(year,district)] += D_arrest[arrest]
  except:
    arrtal[(year,district)] = D_arrest[arrest]
  try:
    arrcount[(year,district)] += 1
  except:
    arrcount[(year,district)] = 1

for year_district in arrtal:
  print '%s,%s,%s' % (year_district[0], year_district[1], float(arrtal[year_district]/arrcount[year_district]))
