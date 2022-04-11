# FIRST EDITION
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

# SECOND EDITION
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

# THIRD EDITION
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
    
# FOURTH EDITION
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
