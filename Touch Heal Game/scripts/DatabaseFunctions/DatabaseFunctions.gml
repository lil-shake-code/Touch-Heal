function SetSimpleData(collectionName, documentName, mapStruct){
	
	var writeId = int64( string(current_time) +string(floor(random(10000))))
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		
		data[? "clientId"] = global.clientId;
		data[? "c"] = collectionName;
		data[? "d"] = documentName;
		data[? "m"] = json_stringify(mapStruct);
		data[? "writeId"] = writeId
		ds_map_add(data,"eventName","set_simple_data");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)
		
		return writeId;

}

function AddToSimpleData(collectionName, documentName, mapStruct){
	
	var patchId = int64( string(current_time) +string(floor(random(10000))))
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		
		data[? "clientId"] = global.clientId;
		data[? "c"] = collectionName;
		data[? "d"] = documentName;
		data[? "m"] = json_stringify(mapStruct);
		data[? "patchId"] = patchId
		ds_map_add(data,"eventName","add_to_simple_data");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)
		
		return patchId;

}

function ReadSimpleData(collectionName, documentName){
	
	var readId = int64( string(current_time) +string(floor(random(10000))))
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		
		data[? "clientId"] = global.clientId;
		data[? "c"] = collectionName;
		data[? "d"] = documentName;
		data[? "readId"] = readId;

		ds_map_add(data,"eventName","read_simple_data");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)
		
		
		return readId;

}


function DeleteSimpleData(collectionName, documentName){
	
	
	var deleteId = int64( string(current_time) +string(floor(random(10000))))
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		
		data[? "clientId"] = global.clientId;
		data[? "c"] = collectionName;
		data[? "d"] = documentName;
		data[? "deleteId"] = deleteId;

		ds_map_add(data,"eventName","delete_simple_data");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)
		
		return deleteId;

}

function GetDatabaseSummary(){
	//format for sending info to server 
		var Buffer = buffer_create(1, buffer_grow, 1)
	
		//WHAT DATA 
		var data = ds_map_create();
		
		data[? "clientId"] = global.clientId;


		ds_map_add(data,"eventName","get_db_summary");
		buffer_write(Buffer, buffer_text, EC(string(json_encode(data))))
		network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
		buffer_delete(Buffer)
		ds_map_destroy(data)



}