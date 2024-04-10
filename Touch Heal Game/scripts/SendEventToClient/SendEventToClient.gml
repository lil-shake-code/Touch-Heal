
function SendEventToClient(recieverClientId,eventName, yourMessageStruct){
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();

		data[?"message"] = json_stringify(yourMessageStruct)
		data[? "clientId"] = global.clientId;
		data[? "RclientId"] = recieverClientId;
		data[? "event"] = eventName
		ds_map_add(data,"eventName","SETC");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)


}