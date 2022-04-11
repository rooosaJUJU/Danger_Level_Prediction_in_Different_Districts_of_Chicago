#!/usr/bin/env python

import sys

L_crime_type = ['Primary Type', 'CONCEALED CARRY LICENSE VIOLATION', 'DECEPTIVE PRACTICE', 'GAMBLING', \
        'INTERFERENCE WITH PUBLIC OFFICER', 'LIQUOR LAW VIOLATION', 'MOTOR VEHICLE THEFT', 'NARCOTICS', \
        'NON - CRIMINAL', 'NON-CRIMINAL', 'NON-CRIMINAL (SUBJECT SPECIFIED)', 'OTHER NARCOTIC VIOLATION', \
        'OTHER OFFENSE', 'RITUALISM', 'PUBLIC PEACE VIOLATION', 'STALKING', 'THEFT', \
        'ARSON', 'ASSAULT', 'BURGLARY', 'CRIMINAL DAMAGE', 'CRIMINAL TRESPASS', \
        'INTIMIDATION', 'PROSTITUTION', 'ROBBERY', 'CRIMINAL SEXUAL ASSAULT', 'BATTERY', \
        'CRIM SEXUAL ASSAULT', 'KIDNAPPING', 'OBSCENITY', 'OFFENSE INVOLVING CHILDREN', \
        'PUBLIC INDECENCY', 'SEX OFFENSE', 'HOMICIDE', 'HUMAN TRAFFICKING', 'WEAPONS VIOLATION']

L_district = ['District','001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017',\
'018','019','020','022','024','025','031']

L_year = ['Date','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014',\
'2015','2016','2017','2018','2019','2020']

for line in sys.stdin:

  line = line.strip().split(",")

  i = 5
  j = 10
  k = 2

  crime_type = line[i]
  district = line[j]
  year = line[k].split('/')[0]

  while crime_type not in L_crime_type:
    i += 1
    if i >= len(line):
      break
    crime_type = line[i]

  while district not in L_district:
    j += 1
    if j >= len(line):
      break
    district = line[j]

  while year not in L_year:
    k += 1
    if k >= len(line):
      break
    year = line[k].split('/')[0]

  print '%s\t%s\t%s' % (year, district, crime_type)
