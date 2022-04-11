#!/bin/bash
hadoop jar /opt/cloudera/parcels/CDH-7.1.7-1.cdh7.1.7.p0.15945976/jars/hadoop-streaming-3.1.1.7.1.7.0-551.jar \
       -Dmapred.reduce.tasks=1 \
       -input /user/xinya.z/Chicago_Crimes.csv \
       -output /user/xinya.z/crime_output \
       -file crime_mapper.py \
       -file crime_reducer.py \
       -mapper "python crime_mapper.py" \
       -reducer "python crime_reducer.py"
