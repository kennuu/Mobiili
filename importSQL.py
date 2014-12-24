#!/usr/bin/python
# -*- coding: utf-8 -*-

import sqlite3 as lite
import sys

CSV = open('/Users/jaakkos/Documents/omat/paino.csv','r')

header = CSV.readline()

con = lite.connect('data/paino.db')

with con:
    cur = con.cursor()
    cur.execute("DROP TABLE Fitness")
    cur.execute("CREATE TABLE Fitness(date TEXT, weight TEXT)")

    for line in CSV:
        fields = line.split(';')
        if len(fields)>=2:
            cur.execute("INSERT INTO Fitness VALUES(?,?)", (fields[0].strip().rstrip(),fields[1].strip().rstrip()))
            print "adding weight: ", fields
            print fields[0].strip().rstrip()
            print fields[1].strip().rstrip()
