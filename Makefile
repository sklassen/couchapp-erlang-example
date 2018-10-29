
all: init populate design idx_javascript idx_erlang

init:
	curl -X PUT http://localhost:5984/example

populate:
	./init-example-db.py 50

design:
	cd javascript; couchapp push
	cd erlang; couchapp push

idx_javascript:
	curl -X GET --max-time 900 "http://localhost:5984/example/_design/javascript/_view/index?reduce=false&limit=10"

idx_erlang:
	curl -X GET --max-time 900 "http://localhost:5984/example/_design/erlang/_view/index?reduce=false&limit=10"

clean:
	curl -X DELETE http://localhost:5984/example


