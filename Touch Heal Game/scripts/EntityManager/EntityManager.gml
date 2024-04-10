function EntityManager(){


var E = json_parse(entities)
var oldKeys = struct_get_names(oldE);

var keys = struct_get_names(E);



//DELETE OLD ENTITIES
for(var i =0 ; i<array_length(oldKeys) ;i++){

	if(!array_contains(keys , oldKeys[i])){
		try{
			with(oOtherPlayersEntity){
				if(real(entityId) == real(oldKeys[i])){
					instance_destroy(id)
				}
			}
			with(oOtherPlayersSmartEntity){
				if(real(entityId) == real(oldKeys[i])){
					instance_destroy(id)
				}
			}
			
		
		}
	}
}





//show_debug_message("keys are "+string(keys))
for (var ii = 0; ii <array_length(keys); ii++) {

    var thisEntityId = real(keys[ii]);

	var thisEntity = variable_struct_get(E , thisEntityId)
	var thisEntityProperties = thisEntity


	//First check if its smart or not
	
	if(struct_exists(json_parse(thisEntityProperties), "__smart__")){
		
		
		
		thisEntityProperties = json_parse(thisEntityProperties)
		var found = false;
		with(oOtherPlayersSmartEntity){
			
			if(real(id.entityId) == real(thisEntityId)  and  real(clientId)==real(other.clientId)){
			
				found = true
				// use thisEntityProperties
				var strc = thisEntityProperties
				var keys2 = variable_struct_get_names(strc);
				//show_debug_message("keys2 are "+string(keys2))
				for (var j = 0; j <array_length(keys2); j++) {
				    var k = keys2[j];
				    var v = variable_struct_get(strc, k)
				    /* Use k and v here */
					if(k!= "clientId" or k!= "entityId"){
						variable_instance_set(id,k, v)
						
					}
				}
			}
		
		}
		
		if(!found){
			
			var new_entity = instance_create_layer(global.RNetSpawnPoints[1][0],global.RNetSpawnPoints[1][1],
			global.OtherPlayerEntityLayerName,oOtherPlayersSmartEntity);
			new_entity.clientId = real(clientId);
			new_entity.entityId = real(thisEntityId)
			
			// use thisEntityProperties
			var strc = thisEntityProperties
			var keys2 = variable_struct_get_names(strc);
			for (var j = 0; j < array_length(keys2); j++) {
			    var k = keys2[j];
			    var v = variable_struct_get(strc, k)
			    /* Use k and v here */
				if(k!= "clientId"  or k!= "entityId"){
					variable_instance_set(new_entity,k, v)
				
				}
			}
			
		}
	
	}
	
	else{
	
	
	//Normal non smart entities
		var found = false;
		with(oOtherPlayersEntity){
			if(entityId == real(thisEntityId)){
			//found entities belonging to this player
			found = true;
			entityProperties = thisEntityProperties
		
			}
		}
	

		if(!found){
			var new_entity = instance_create_layer(global.RNetSpawnPoints[1][0],global.RNetSpawnPoints[1][1],
			global.OtherPlayerEntityLayerName,oOtherPlayersEntity);
			new_entity.clientId = real(clientId);
			new_entity.entityId = real(thisEntityId)
			new_entity.entityProperties = thisEntityProperties
		
		}
	}
	
	
}





oldE = E

}