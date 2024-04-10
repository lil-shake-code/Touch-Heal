function CallGeneralAI(messagesArray, temperature){
		var callId = int64( string(current_time) +string(floor(random(10000))))
		
		
		
			//format for sending info to server 
			var Buffer = buffer_create(1, buffer_grow, 1)
	
			//WHAT DATA 
			var data = ds_map_create();
			data[? "clientId"] = global.clientId;
			var t = []
			for(var i =0; i<array_length(messagesArray); i++){
				t[0] = json_stringify(messagesArray[i])
			}
	
		
			data[? "messagesArray"] =json_stringify(t)
			data[? "callId"] = callId;
			data[? "temperature"] = temperature;

			ds_map_add(data,"eventName","call_general_ai");
			buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
			
			return callId
			
}