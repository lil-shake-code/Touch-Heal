function callback_ReadSimpleData(readId,data){
	
	//if data is -1, the read failed, The Document was not found!
	//check the location(collection + document name) onceagain
	if(data == -1){
		show_message("failed       read")
	}
	

	
	//the document is a struct in the variable data
	show_message("read id "+string(readId)+" : "+string(data))

}