# Upload csv file to server
scp -i Desktop/S_keypair.pem Desktop/Chicago_Crimes.csv jingyi.zhu@18.206.158.228:Chicago_Crimes.csv

# Copy the file to HDFS
hdfs dfs -put Chicago_Crimes.csv

# NANO the Python File
nano arrest_mapper.py
nano arrest_reducer.py

# Make both 'py' executable
chmod +x arrest_mapper.py
chmod +x arrest_reducer.py

# Execute both codes using standard IO
nano arrest.sh

# Run bash
bash arrest.sh

# Copy to local
hdfs dfs -cat arrest_result/part-00000 > ~/arrest_ratio.csv

# Show the result
cat arrest_ratio.csv
