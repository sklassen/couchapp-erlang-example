function(doc, req) {  

	if (doc!=null) {
		return({body:''+doc['_id']+'\n',headers : {'Content-Type' : 'text/plain'}}) 
	} else { 
		return({code: 404, body: 'not found'}) 
	}
}
