
all: init populate design idx_javascript idx_erlang

USER=admin
PASSWD=B1stDB

init:
	curl -X PUT http://${USER}:${PASSWD}@localhost:5984/example

populate:
	./init-example-db.py 50

design:
	cd javascript; couchapp push http://${USER}:${PASSWD}@localhost:5984/example
	cd erlang; couchapp push http://${USER}:${PASSWD}@localhost:5984/example

idx_javascript:
	curl -X GET --max-time 900 "http://${USER}:${PASSWD}@localhost:5984/example/_design/javascript/_view/index?reduce=false&limit=10"

idx_erlang:
	curl -X GET --max-time 900 "http://${USER}:${PASSWD}@localhost:5984/example/_design/erlang/_view/index?reduce=false&limit=10"

show_javascript:
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/javascript/_view/index?reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/javascript/_list/csv/index?reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/javascript/_show/id/1001"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/javascript/_show/xml/1001?id=A/AA"

show_erlang:
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/erlang/_view/index?id=A/AA&reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/erlang/_list/csv/index?id=A/AA&reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/erlang/_show/id/1001"
	curl -X GET "http://${USER}:${PASSWD}@localhost:5984/example/_design/erlang/_show/xml/1001?id=A/AA"

clean:
	curl -X DELETE http://${USER}:${PASSWD}@localhost:5984/example
