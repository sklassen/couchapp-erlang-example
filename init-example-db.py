#!/usr/bin/python3

import sys
import couchdb
import random

if len(sys.argv)!=5:
    print("Usage: init-example USER PASSWD Number_Docs Number_Letters")
    sys.exit(1)

user=sys.argv[1]
passwd=sys.argv[2]
n_docs=int(sys.argv[3])
n_letters=min(26,int(sys.argv[4]))

srv=couchdb.Server(url='http://'+user+':'+passwd+'@127.0.0.1:5984/')

if not 'example' in srv:
	srv.create('example')

db=srv['example']

rows = db.view('_all_docs',descending=True)
n_start=1001
for row in rows:
	if row['id'].isnumeric():
		n_start=int(row['id'])+1
		break

ids=map(lambda x: str(x),range(n_start,n_start+n_docs))

alphabet = []
for letter in range(65, 65+n_letters): # 65+26=91
    alphabet.append(chr(letter))

for idx in ids:
	doc={}
	for z in alphabet:
		doc[z]={}
		for x in alphabet:
			for y in alphabet:
				doc[z][x+y]=random.randint(1,101)
	db[idx]={'data':doc}

print("Done")
exit(0)
