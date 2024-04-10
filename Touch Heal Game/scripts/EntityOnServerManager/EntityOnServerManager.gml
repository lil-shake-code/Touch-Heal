function EntityOnServerManager(){
try{
var E = json_parse(entitiesOnServer)


var keys = variable_struct_get_names(E);






for (var i = array_length(keys)-1; i >= 0; --i) {
    var thisEntityId = keys[i];


		var thisEntityPropertiesFromServer = variable_struct_get(E , thisEntityId);
	
	
	var found = false;
	with(oOtherPlayersEntity){
		if(entityId == real(thisEntityId)){
		//found entities belonging to this player
		found = true;
		entityPropertiesFromServer = thisEntityPropertiesFromServer
		
		}
	}
	
	
	if(!found){
		show_debug_message("creating a new entity")
		var new_entity = instance_create_layer(0,0,global.OtherPlayerEntityLayerName,oOtherPlayersEntity);
		new_entity.clientId = real(clientId);
		new_entity.entityId = real(thisEntityId)
		new_entity.entityPropertiesFromServer = thisEntityPropertiesFromServer
		
	}
	
}








}catch(e){
	show_debug_message(e)
}
}