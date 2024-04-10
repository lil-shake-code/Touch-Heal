/// @description Entity Sharing
try{
	
	if(global.clientId != -1)
	{
		
	with(oMyEntity){
	
		
		if(variable_instance_exists(oBrain,"socket")){
	
			//format for sending info to server 
			var Buffer = buffer_create(1, buffer_grow, 1)
	
			//WHAT DATA 
			var data = ds_map_create();
	
			//whatever data you want to send as key value pairs

			data[? "clientId"] = global.clientId;
			data[?"entityId"] = entityId
			var eP = entityProperties
			eP[? "__smart__"] = false
			data[?"entityP"] = json_stringify(eP)

			
			ds_map_add(data,"eventName","entity_state_update");
			buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
			

		}
	}
	
	
	
	with(oMySmartEntity){
	
		
		if(variable_instance_exists(oBrain,"socket")){
	
			//format for sending info to server 
			var Buffer = buffer_create(1, buffer_grow, 1)
	
			//WHAT DATA 
			var data = ds_map_create();
	
			//whatever data you want to send as key value pairs

			data[? "clientId"] = global.clientId;
			data[?"entityId"] = entityId
		
			
			
			///
			var variablesStruct = {}
			var array = variable_instance_get_names(id);
		
			for (var i = 0; i < array_length(array); i++;)
			{
			    var key = array[i] 
			    var value = variable_instance_get(id, array[i])
				if(key != "entityProperties"){
					if(string_pos("___", key) == 0 ){
						struct_set(variablesStruct,key, value )
					}else{
						var newKey = string_delete(key,1,1)
						newKey = string_delete(newKey,1,1)
						newKey = string_delete(newKey,1,1)
						
						struct_set(variablesStruct,newKey, value )
						
					}
				}
			}
			///
			
			
			data[?"entityP"] = json_stringify(variablesStruct)
	

			
			ds_map_add(data,"eventName","entity_state_update");
			buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
		}

		
	
	
	
	
	
	
	
	
	}
	}
	
}catch(e){
	show_debug_message("Error in updating some entity. If this persists, check your code. The error is being printed now.")
	show_debug_message(e)
}
	
	
alarm[0] =global.entitySharingFrequency;