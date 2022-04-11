# Code for wordcount in descriptions
hdfs dfs -put Chicago_Crimes.csv
nano crime_mapper.py

nano crime_reducer.py

chmod +x crime_mapper.py
chmod +x crime_reducer.py

nano crime_bash.sh
hdfs dfs -cat crime_output/part-00000 | sort -k2 -rn | head -20

# Code for wordclouds
nano word_map.py

nano wordcloud.py

cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample.txt
cat sample.txt | shuf -n 10000 >> sample10000.txt
cat sample.txt | shuf -n 10000 >> sample10000_2.txt
cat sample.txt | shuf -n 10000 >> sample10000_3.txt

nano wordcloud.py

cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2015.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2015_3.txt

nano wordcloud.py

cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2010.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2010_3.txt

nano wordcloud.py

cat Chicago_Crimes.csv|python word_map.py |python wordcloud.py > sample2005.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_1.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_2.txt
cat sample2015.txt |shuf -n 10000 >> sample2005_3.txt
