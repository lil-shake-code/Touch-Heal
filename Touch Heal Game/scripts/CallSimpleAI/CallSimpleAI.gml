function CallSimpleAI(yourMessage, temperature, threadId){
	
		var callId = int64( string(current_time) +string(floor(random(10000))))
		
		if(is_undefined(threadId)){
			threadId = callId
		
		
		
			//format for sending info to server 
			var Buffer = buffer_create(1, buffer_grow, 1)
	
			//WHAT DATA 
			var data = ds_map_create();
		
			data[? "clientId"] = global.clientId;
			var t = 	
				[
					json_stringify({ role: "user", content: yourMessage} )
				]
		struct_set(oBrain.aiThreads, threadId, [{ role: "user", content: yourMessage}] )
		
			data[? "thread"] =json_stringify(t)
			data[? "callId"] = callId;
			data[? "threadId"] = threadId;
			data[? "temperature"] = temperature;

			ds_map_add(data,"eventName","call_simple_ai");
			buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
			
			
			
			
		}else{
			// you need to json stringify the full thread now
			
			
			var t = struct_get(oBrain.aiThreads, string(threadId))  //this thread array
			if(is_undefined(t)){
				CallSimpleAI(yourMessage, temperature)
			}else{
				
				t[array_length(t)] = ({ role: "user", content: yourMessage} )
				
				
				struct_set(oBrain.aiThreads, threadId, t)
				
				for(var i = 0 ; i<array_length(t); i++){
					if(typeof(t[i]) == "struct"){
						t[i] = json_stringify(t[i])
					}
				
					
				}
			 
			  //every element is stringified now
			  
			  
			  
			  
			  
			  //format for sending info to server 
			var Buffer = buffer_create(1, buffer_grow, 1)
	
			//WHAT DATA 
			var data = ds_map_create();
		
			data[? "clientId"] = global.clientId;
			data[? "thread"] =json_stringify(t)
			data[? "callId"] = callId;
			data[? "threadId"] = threadId;
			data[? "temperature"] = temperature;

			ds_map_add(data,"eventName","call_simple_ai");
			buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
			  
			  
			  
			  
			  
			  
			}
			
			
		
		}
		
		
		return callId;

}