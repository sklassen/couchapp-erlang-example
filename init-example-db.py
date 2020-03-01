#!/usr/bin/python3

import sys
import couchdb
import random

if len(sys.argv)==2:
	n_docs=int(sys.argv[1])
else:
	n_docs=5000

srv=couchdb.Server(url='http://admin:3igWheel@127.0.0.1:5984/')

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
for letter in range(65, 91):
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
