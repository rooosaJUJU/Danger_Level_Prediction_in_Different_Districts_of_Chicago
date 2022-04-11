#!/bin/bash
hadoop jar /opt/cloudera/parcels/CDH-7.1.7-1.cdh7.1.7.p0.15945976/jars/hadoop-streaming-3.1.1.7.1.7.0-551.jar \
        -Dmapred.reduce.tasks=1 \
        -input /user/jingyi.zhu/Chicago_Crimes.csv \
        -output /user/jingyi.zhu/crime_type \
        -file yr_crime_mapper.py \
        -file yr_crime_reducer.py \
        -mapper 'python yr_crime_mapper.py' \
        -reducer 'python yr_crime_reducer.py'
