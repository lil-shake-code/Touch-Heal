/// @description Ping
//format for sending info to server 

if(variable_instance_exists(oBrain,"socket") and global.clientId!=-1){
	try{
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		data[? "ct"] = current_time;
	
		data[? "clientId"] = global.clientId
	
		
		ds_map_add(data,"eventName","ping");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)
	}
}
alarm[1] = 25

afk = current_time - last_got_ping
