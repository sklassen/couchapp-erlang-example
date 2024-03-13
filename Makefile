
all: init populate push_javascript push_erlang idx_javascript idx_erlang

HOST=127.0.0.1
PORT=5984
ADMIN=admin
PASSWD=Be1stDB
DB=example

COUCHAPP=couchapp-sklassen.couchapp

init:
	curl -X PUT http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}

populate:
	./init-${DB}-db.py ${ADMIN} ${PASSWD} 50 10

push_javascript:
	${COUCHAPP} push ./javascript http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}

push_erlang:
	${COUCHAPP} push ./erlang http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}

put_javascript:
	curl -X PUT "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_update/put/A?tq=A&dt=2024-01-01&val=3.0"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/A"

idx_javascript:
	curl -X GET --max-time 900 "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_view/index?reduce=false&limit=10"

idx_erlang:
	curl -X GET --max-time 900 "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_view/index?reduce=false&limit=10"

show_javascript:
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_view/index?reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_list/csv/index?reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_show/id/1001"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_show/xml/1001?id=A/AA"

show_erlang:
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_view/index?id=A/AA&reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_list/csv/index?id=A/AA&reduce=false&s=1001&e=1020&limit=10"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_show/id/1001"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_show/xml/1001?id=A/AA"

clean:
	curl -X DELETE http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}
 
put_javascript:
	curl -X PUT "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_update/put?tq=A&dt=2024-01-01&val=3.0"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/A"
	curl -X PUT "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/javascript/_update/put/A?dt=2024-01-01&val=3.1"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/A"

put_erlang:
	curl -X PUT "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_update/put?tq=A&dt=2024-01-01&val=3.0"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/A"
	curl -X PUT "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/_design/erlang/_update/put/A?dt=2024-01-01&val=3.1"
	curl -X GET "http://${ADMIN}:${PASSWD}@${HOST}:${PORT}/${DB}/A"
