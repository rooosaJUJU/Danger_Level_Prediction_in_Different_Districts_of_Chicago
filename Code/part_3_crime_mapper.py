#!/usr/bin/env python
import sys
for line in sys.stdin:
  line = line.strip()
  crime_type = line.split(",")[5]
  district = line.split(",")[11]
  print '%s\t%s' % (district, crime_type)
