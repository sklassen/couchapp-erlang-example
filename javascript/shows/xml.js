function(doc, req) {  

	if (doc!=null) {
		catagory=req.query.id.split('/')[0];
		index=req.query.id.split('/')[1];
		head='<?xml version="1.0"?>\n<object name="">\n';
		foot='</object>\n';
		
		return({body:head+'\t<id>'+doc._id+'</id>\n\t<key>'+req.query.id+'</key>\n\t<value>'+doc.data[catagory][index]+'</value>\n'+foot,headers : {'Content-Type' : 'application/xml'}}) 
	} else { 
		return({code: 404, body: 'not found'}) 
	}
}
