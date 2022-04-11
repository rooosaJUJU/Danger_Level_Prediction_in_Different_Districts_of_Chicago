#!/usr/bin/env python

import sys

typetal = {}
typecount = {}

D = {'CONCEALED CARRY LICENSE VIOLATION':1.0, 'DECEPTIVE PRACTICE':1.0, 'GAMBLING':1.0, \
        'INTERFERENCE WITH PUBLIC OFFICER':1.0, 'LIQUOR LAW VIOLATION':1.0, 'MOTOR VEHICLE THEFT':1.0, \
  'NARCOTICS':1.0, 'NON - CRIMINAL':1.0, 'NON-CRIMINAL':1.0, 'NON-CRIMINAL (SUBJECT SPECIFIED)':1.0, \
        'OTHER NARCOTIC VIOLATION':1.0, 'OTHER OFFENSE':1.0, 'RITUALISM':1.0, 'PUBLIC PEACE VIOLATION':1.0, \
        'STALKING':1.0, 'THEFT':1.0, 'ARSON':2.0, 'ASSAULT':2.0, 'BURGLARY':2.0, 'CRIMINAL DAMAGE':2.0, \
        'CRIMINAL TRESPASS':2.0, 'INTIMIDATION':2.0, 'PROSTITUTION':2.0, 'ROBBERY':2.0, 'CRIMINAL SEXUAL ASSAULT':3.0, \
        'BATTERY':3.0, 'CRIM SEXUAL ASSAULT':3.0, 'KIDNAPPING':3.0, 'OBSCENITY':3.0, 'OFFENSE INVOLVING CHILDREN':3.0, \
        'PUBLIC INDECENCY':3.0, 'SEX OFFENSE':3.0, 'HOMICIDE':4.0, 'HUMAN TRAFFICKING':4.0, 'WEAPONS VIOLATION':4.0}

L_district = ['001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017', \
'018','019','020','022','024','025','031']

L_year = ['2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014',\
'2015','2016','2017','2018','2019','2020']

for line in sys.stdin:
  line = line.strip().split('\t')
  if len(line) == 3:
    year = line[0]
    district = line[1]
    crime_type = line[2]
  else:
    continue
  if year not in L_year:
    continue
  if district not in L_district:
    continue
  if crime_type not in D:
    continue
  year = int(year)
  try:
    typetal[(year,district)] += D[crime_type]
  except:
    typetal[(year,district)] = D[crime_type]
  try:
    typecount[(year,district)] += 1
  except:
    typecount[(year,district)] = 1
for year_district in typetal:
  print '%s,%s,%s' % (year_district[0], year_district[1], float(typetal[year_district]/typecount[year_district]))
