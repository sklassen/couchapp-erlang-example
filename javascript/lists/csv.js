function(head, req) {
  var row;
  start({
    "headers": {
      "Content-Type": "text/plain"
     }
  });

  send("key,rate\n");
  pr=null
  while(row = getRow()) {
	var cn=row.key[0];
	var nm=row.key[1];
	var id=row.key[2];
	var rt=row.value;

	if (req.query.hasOwnProperty("s"))
		if (id<req.query.s.replace(/"/g,""))
			continue;

	if (req.query.hasOwnProperty("e"))
		if (id>req.query.e.replace(/"/g,""))
			continue;

	if (pr==id)
		continue;

	pr=id

	send(cn+"/"+nm+","+id+","+rt+ "\n");
  }

}
