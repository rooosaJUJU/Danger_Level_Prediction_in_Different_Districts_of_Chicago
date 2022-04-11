#!/bin/bash
hadoop jar /opt/cloudera/parcels/CDH-7.1.7-1.cdh7.1.7.p0.15945976/jars/hadoop-streaming-3.1.1.7.1.7.0-551.jar \
        -Dmapred.reduce.tasks=1 \
        -input /user/jingyi.zhu/Chicago_Crimes.csv \
        -output /user/jingyi.zhu/arrest_result \
        -file arrest_mapper.py \
        -file arrest_reducer.py \
        -mapper 'python arrest_mapper.py' \
        -reducer 'python arrest_reducer.py'
