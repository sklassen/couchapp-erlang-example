# couchapp-erlang-example

The Makefile creates a database and populates it with several hundered (largish) documents.

There are two design documents, javascript and erlang. Both generate the same views.

The Makefile also has several examples.


Requirements

Ubuntu Users will need these packages

> sudo apt-get install couchapp python-couchdb

CouchDB configuration need the native erlang views switched on in the local.ini 

```
[native_query_servers]
enable_erlang_query_server = true
```


`http://localhost:5984/example/_design/erlang/_view/index?reduce=false&limit=100`
`http://localhost:5984/example/_design/erlang/_list/csv/index?reduce=false&limit=100`

