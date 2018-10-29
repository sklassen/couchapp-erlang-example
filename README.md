# couchapp-erlang-example

The Makefile creates a database and populates it with several hundered (largish) documents.

There are two design documents, javascript and erlang. Both generate the same views.

The Makefile also has several examples.


Requirements

Ubuntu Users will need these packages

> sudo apt-get install couchapp python-couchdb

CouchDB configuration need the native erlang views switched on

> erlang="{couch_native_process,start_link,[]}"

