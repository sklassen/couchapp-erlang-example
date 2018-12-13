function(head, req) {
  var row;
  start({
    "headers": {
      "Content-Type": "text/html"
     }
  });

  sep=",";
  ids= [] // (req.query.keys).replace(/[\["\]]/g,"").split(",");
  send("<table>\n<thead>\n\t<tr>");
  send("<th>key</th><th>value</th>");
  for (var i in ids)
  	send("<th>"+ids[i]+"</th>");
  send("</tr>\n</thead>\n");

  var data={};
  var idx=0
  while(row = getRow()) {
	var dt= row.key[2] // row.value.dt;
    var rt =row.value;
	if (req.query.hasOwnProperty("s"))
		if (dt<req.query.s.replace(/"/g,""))
			continue;

    //log(row)
	if (req.query.hasOwnProperty("e"))
		if (dt>req.query.e.replace(/"/g,""))
			continue;

	if (data[dt]===undefined)
		data[dt]=[];

	data[dt]= row.value // row.value.rt;
    idx = idx + 1
  }

  send("<tbody>\n");
  var dts=Object.keys(data).sort();
  idx=0
  var previousdt
  for(var d in dts) {
	dt=dts[d];
    if (dt == previousdt)
        continue;
  	send('\t<tr>');
  	send("<th class='key'>"+dt+"</th>");
    send("<td class='number'>" + data[dt] + "</td>");
  	send("</tr>\n");
    idx +=1
    dt = previousdt
  }
  send("</tbody>\n</table>\n");

}
