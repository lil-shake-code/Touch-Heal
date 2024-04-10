
function callback_ShowAllPersistentObjectsInRoom(array_of_persistent_objects, roomId){
	//What do you want to do with the array of all 
	// persistent object  ids in this room?
	if(array_of_persistent_objects == -1){
		show_message("room does not exist")
	}
	if(is_array(array_of_persistent_objects)){
		show_message( string(array_of_persistent_objects)+" in "+roomId);
	}
}