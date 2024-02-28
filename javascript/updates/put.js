function(doc, req) {
	
	if (!doc) {
		doc = {"type":"backbuild","data":{}};
		if (req.query.tq!=null)
			doc["_id"]=req.query.tq
	}

	if (doc.type!="backbuild")
		return [null, "Cannot modify VRE file" ]

	if (!req.query.dt)
		return [null, "Needs dt=yyyy-mm-dd" ]

	if (!req.query.val)
		return [null, "Needs val of float" ]

	if (doc.data[req.query.dt]!=Number(req.query.val)) {
		doc.data[req.query.dt]=Number(req.query.val)
		return [doc, "ok"+req.query.dt+","+req.query.val ]
	} else {
		return [null, "no change" ]
	}


}

