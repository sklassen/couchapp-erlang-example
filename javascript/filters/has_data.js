function(doc, req) { 
  if('data' in doc) { 
    return true; 
  } else {
    return false; 
  }
}
