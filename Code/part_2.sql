# Monthly Distribution
SELECT substr(`date`,1,2) as month_occurred, count(*) as case_num
FROM chicago_crimes
GROUP BY substr(`date`,1,2)
SORT BY month_occurred DESC

# Monthly distribution by District
SELECT district,substr(`date`,1,2) as month_occurred, count(*) as case_num
FROM chicago_crimes
GROUP BY substr(`date`,1,2),district
SORT BY district ASC, case_num DESC

# Hourly distribution Total
SELECT substr(from_unixtime(unix_timestamp(`date`,'MM/dd/yyyy hh:mm:ss aa'),
'MM-dd-yyyy HH:mm:ss'),12,2) as hour_occured, count(*) as case_num
FROM chicago_crimes
GROUP BY substr(from_unixtime(unix_timestamp(`date`,'MM/dd/yyyy hh:mm:ss aa'),
'MM-dd-yyyy HH:mm:ss'),12,2)
SORT BY case_num

# Hourly Distribution By District
SELECT district,substr(from_unixtime(unix_timestamp(`date`,'MM/dd/yyyy hh:mm:ss aa'),
'MM-dd-yyyy HH:mm:ss'),12,2) as hour_occured, count(*) as case_num
FROM chicago_crimes
GROUP BY substr(from_unixtime(unix_timestamp(`date`,'MM/dd/yyyy hh:mm:ss aa'),
'MM-dd-yyyy HH:mm:ss'),12,2), district
SORT BY district ASC, case_num DESC
