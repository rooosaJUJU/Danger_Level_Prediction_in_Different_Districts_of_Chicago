# PySpark
crime_rdd=sc.textFile(“Chicago_Crimes.csv”)
crime_rdd.take(2)

header=crime_rdd.first()
crime_rdd1=crime_rdd.filter(lambda line: line != header)
crime_rdd1.take(2)

crime_rdd2=crime_rdd1.map(lambda x: x.split(“,”)).map(lambda x: [x[11].encode(‘ascii’), x[5].encode(‘ascii’), x[0].encode(‘ascii’)])
crime_rdd2.take(2)

df=sqlContext.createDataFrame(crime_rdd2, [‘district’, ‘crime_type’, ‘id’])
df.show(2)

df1=df.groupBy(“district”, “crime_type”).agg({‘id’: ‘count’})
df1.show(2)

df1.sort(‘count(id)’, ascending=False).show(15)

# MapReduce
nano crime_mapper.py

nano crime_reducer.py

cat Chicago_Crimes.csv | python crime_mapper.py | python crime_reducer.py

nano crime_runmr.sh

bash crime_runmr.sh

hdfs dfs -cat crimes_output/part-00000 | sort -k2 -rn
