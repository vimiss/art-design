function len(s){
		var length=0;
		var str=s.split("");
		for(var i=0;i<str.length;i++){
			if(str[i].charCodeAt(0)<299){
			  length++;
			}else{
				length+=2;
			}
		}
		return length;
	}