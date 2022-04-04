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

    L_district = ['001','002','003','004','005','006','007','008','009','010','011','012','014','015','016','017', \
                  '018','019','020','022','024','025','031']
    if district in L_district:
        words=des.split()
        for word in words:
            print '%s\t%s' %(word.lower(), 1)
