hdfs dfs -put Chicago_Crimes.csv
nano crime_mapper.py
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
nano crime_reducer.py
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

chmod +x crime_mapper.py
chmod +x crime_reducer.py

nano crime_bash.sh
#!/bin/bash
hadoop jar /opt/cloudera/parcels/CDH-7.1.7-1.cdh7.1.7.p0.15945976/jars/hadoop-streaming-3.1.1.7.1.7.0-551.jar \
       -Dmapred.reduce.tasks=1 \
       -input /user/xinya.z/Chicago_Crimes.csv \
       -output /user/xinya.z/crime_output \
       -file crime_mapper.py \
       -file crime_reducer.py \
       -mapper "python crime_mapper.py" \
       -reducer "python crime_reducer.py"

bash crime_bash.sh
hdfs dfs -cat crime_output/part-00000 | sort -k2 -rn | head -20

2.Code for wordclouds:
nano word_map.py
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
nano wordcloud.py
#!/usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split("\t")
    year = words[0]
    dis = words[1]
    des = words[2]
    if year == "2020":
       des = des.replace(" ", "~")
       print ('%s' %des)

cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample.txt
cat sample.txt | shuf -n 10000 >> sample10000.txt
cat sample.txt | shuf -n 10000 >> sample10000_2.txt
cat sample.txt | shuf -n 10000 >> sample10000_3.txt
nano wordcloud.py
#!/usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split("\t")
    year = words[0]
    dis = words[1]
    des = words[2]
    if year == "2015":
       des = des.replace(" ", "~")
       print ('%s' %des)
cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2015.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_3.txt
nano wordcloud.py
#!/usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split("\t")
    year = words[0]
    dis = words[1]
    des = words[2]
    if year == "2010":
       des = des.replace(" ", "~")
       print ('%s' %des)
cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2010.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_3.txt
nano wordcloud.py
#!/usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split("\t")
    year = words[0]
    dis = words[1]
    des = words[2]
    if year == "2005":
       des = des.replace(" ", "~")
       print ('%s' %des)
cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2005.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_3.txt
