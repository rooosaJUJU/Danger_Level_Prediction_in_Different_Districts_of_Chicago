'''Step 1 Code'''
# Upload csv file to server
scp -i Desktop/S_keypair.pem Desktop/Chicago_Crimes.csv jingyi.zhu@18.206.158.228:Chicago_Crimes.csv

# Copy the file to HDFS
hdfs dfs -put Chicago_Crimes.csv

# NANO the Python File
nano yr_arrest_mapper.py
nano yr_arrest_reducer.py

# Make both 'py' executable
chmod +x yr_arrest_mapper.py
chmod +x yr_arrest_reducer.py

# Execute both codes using standard IO
Nano yr_arrest.sh

# Run bash
bash yr_arrest.sh

# Copy to local
hdfs dfs -cat arrest_ratio/part-00000 > ~/yr_arrest_ratio.csv

# Copy to Desktop
scp -i Desktop/S_keypair.pem jingyi.zhu@18.206.158.228:yr_arrest_ratio.csv ~/Desktop/

'''Step 2 Code'''
# NANO the Python File
nano yr_crime_mapper.py
nano yr_crime_reducer.py

# Make both 'py' executable
chmod +x yr_crime_mapper.py
chmod +x yr_crime_reducer.py

# Execute both codes using standard IO
Nano yr_crime.sh

# Run bash
bash yr_crime.sh

# Copy to local
hdfs dfs -cat crime_type/part-00000 > ~/yr_crime_type.csv

# Copy to Desktop
scp -i Desktop/S_keypair.pem jingyi.zhu@18.206.158.228:yr_crime_type.csv ~/Desktop/
