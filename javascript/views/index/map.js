function(doc) {
	for (var catagory in doc.data) { 
		for(var index in doc.data[catagory]) { 
			emit([catagory,index,doc._id], doc.data[catagory][index]); 
		} 
	}
}

