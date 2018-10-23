
all: init populate design javascript erlang

init:
	curl -X PUT http://localhost:5984/example

populate:
	./init-example-db.py 50

design:
	cd javascript; couchapp push
	cd erlang; couchapp push

javascript:
	curl -X GET --max-time 900 "http://localhost:5984/example/_design/javascript/_view/index?reduce=false&limit=10"

erlang:
	curl -X GET --max-time 900 "http://localhost:5984/example/_design/erlang/_view/index?reduce=false&limit=10"

clean:
	curl -X DELETE http://localhost:5984/example


