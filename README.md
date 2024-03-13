# couchapp-erlang-example

The Makefile creates a database and populates it with several hundered (largish) documents.

There are two design documents, javascript and erlang. Both generate the same views.

The Makefile also has several examples.


Requirements

Ubuntu Users will need these packages

> sudo apt-get install couchapp python-couchdb

couchapp uses python 2.x. If this is a problem on your system, you can use a snap package.

> sudo snap install couchapp-sklassen

CouchDB configuration need the native erlang views switched on in the local.ini 

```
[native_query_servers]
enable_erlang_query_server = true
```

Then you can try the URLs to access the view, list, show and update functions.

`http://localhost:5984/example/_design/erlang/_view/index?reduce=false&limit=100`
`http://localhost:5984/example/_design/erlang/_list/csv/index?reduce=false&limit=100`
`http://localhost:5984/example/_design/erlang/_show/id/A`
`http://localhost:5984/example/_design/erlang/_update/put/A?dt=2024-01-01&val=3.3`
