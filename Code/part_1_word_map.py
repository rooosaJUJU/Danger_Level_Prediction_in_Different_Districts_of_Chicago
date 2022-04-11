#!/usr/bin/env python

import sys

for line in sys.stdin:
  line = line.strip()
  if line.split(",")[6] == '' or line.split(",")[6] == 'Description'\
     or line.split(",")[11] == '' or line.split(",")[17] == '':
    continue
    
  des = line.split(",")[6]
  district = line.split(",")[11]
  year = line.split(",")[17]
  print '%s\t%s\t%s' % (year, district, des)
