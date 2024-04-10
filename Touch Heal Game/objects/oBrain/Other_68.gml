/// @description Async ws Events. Do Not Tamper!
var type = async_load[? "type"]
if(type == network_type_non_blocking_connect){
	if( async_load[? "succeeded"] == false){
		show_debug_message("failed non blocking connection. Please check your internet connection and firewalls.")
	}
	if( async_load[? "succeeded"] == true){
		show_debug_message("Succeeded non blocking conection. ")
		non_blocking_success_yet = true;
		
			//code to join server
			
			var Buffer = buffer_create(1, buffer_grow, 1)
			//WHAT DATA 
			var data = ds_map_create();
			data[? "serverId"] = md5_string_utf8(global.SERVERID);
			data[? "gameId"] = (global.gameId);
			data[? "guildId"] = global.discordServerId
			data[? "uC"] = global.useCiphering;
			data[? "v"] = 2
			//whatever data you want to send as key value pairs

			ds_map_add(data,"eventName","join_server");
			buffer_write(Buffer, buffer_text, ((json_encode(data))))
			network_send_raw(oBrain.socket, Buffer, buffer_tell(Buffer),network_send_text)
			buffer_delete(Buffer)
			ds_map_destroy(data)
			
			
			
			
	}
	//there was code here for join server
	//ConnectToServer()
}
if(type == network_type_data){
	var buffer_raw = async_load[? "buffer"];
	var buffer_processed = buffer_read(buffer_raw , buffer_text);
	
	if(string_pos("eventName", buffer_processed)!=0){
		//eventName is there
		var realData = json_parse(buffer_processed)
		
	}else{
		var decrypted = substitutionDecrypt(buffer_processed,global.SERVERID)
		var realData = json_parse(decrypted)
	}

	
	
	
	
	if(variable_struct_exists(realData , "eventName")){
		//show_message(buffer_processed)
	}
	var eventName = variable_struct_get(realData,"eventName")
	
	
	
	
	
	switch(eventName){
		case "created_you":
			global.clientId = realData.clientId
			global.roomId = string(global.clientId)
			alarm[2] = 1;
			callback_ConnectToServer();
		break;
		
		case "alert":
		//show_message(buffer_processed)
			if(realData.type == "show"){
				callback_Admin(realData.message)
			
			}
		
		break;
		
		case "changed_room":
		if(realData.roomId == string(global.clientId)){
			global.roomId = realData.roomId
			callback_LeaveRoom()
		}else{
			global.roomId = realData.roomId
			callback_ChangeRoom(realData.roomId)
		}
		instance_destroy(oOtherPlayer)
		
		with(oPersistentObject){
			if(roomId!=realData.roomId){
				instance_destroy(id)
			}
		}
		
		
		break;
		
		
		case "all_rooms":
		callback_ShowAllRooms(realData.rooms)
		break;
		
		case "all_clients":
		callback_ShowAllClientsInRoom(realData.clients, realData.roomId)
		break;
		
		
		case "all_pO":
	
		callback_ShowAllPersistentObjectsInRoom(realData.pOs, realData.roomId)
		break;
		
		
		case "state_update":
		//show_message(buffer_processed)
		
		if(real(realData.clientId)==global.clientId){
			
			//shared peroperties from server
			try{
				global.sharedPropertiesFromServer = json_parse(realData.SPS)
			}catch(e){}
			 ///unfortunately the sp was not parseable!
			// show_message("sps parse error")
			
			

			
			
			
		
				var E = json_parse(realData.entitiesOnServer)
				
				var oldKeys = []
				with(oMyEntity){
					array_push(oldKeys,id.entityId)
				}

				var keys = variable_struct_get_names(E);
				
				//DELETE ENTITIES THAT have been delted on server
				
				//No dont! This part needs careful async action
				
				/*
				with(oMyEntity){
					
					if(!array_contains(keys, string(oMyEntity.entityId))){
						//instance_destroy()
					}
					
				}
				*/

		




                /// EDIT AND CREATE YOUE ENTITIES

				for (var i = array_length(keys)-1; i >= 0; --i) {
				    var thisEntityId = keys[i];
					
					
					
						var thisEntityPropertiesFromServer = variable_struct_get(E , thisEntityId);
	
				    
	
					var found = false;
					with(oMyEntity){
						if(entityId == real(thisEntityId) ){
						//found entities belonging to this player
						found = true;
						try{
							//entityProperties =json_parse( thisEntityProperties)
							entityPropertiesFromServer = thisEntityPropertiesFromServer
						}catch(e){}
		
						}
					}
	
	/*
					if(!found){
						show_debug_message("creating a new entity")
						var new_entity = instance_create_layer(0,0,global.OtherPlayersLayerName,oMyEntity);
						new_entity.clientId = real(clientId);
						new_entity.entityId = real(thisEntityId)
						try{
							new_entity.entityProperties = json_parse(thisEntityProperties)
							entityPropertiesFromServer = thisEntityPropertiesFromServer
						
						}catch(e){}
	
					}
					*/
				}
				
		}
		
		
		var found = false;
		with(oOtherPlayer){
			if(clientId==real(realData.clientId)){
				afk = realData.afk
				sharedProperties = realData.SP;
				sharedPropertiesFromServer = realData.SPS
				found = true;
				//show_debug_message("found this player")
				//Now also update the entities for this player
				entities =(realData.entities);
				entitiesOnServer =(realData.entitiesOnServer);
				
			
				
			}
		}
		if(!found and real(realData.clientId!=global.clientId)){
			//show_debug_message("creating a new player")
			var new_enemy = instance_create_layer(global.RNetSpawnPoints[0][0],global.RNetSpawnPoints[0][1],
			global.OtherPlayersLayerName,oOtherPlayer);
			new_enemy.clientId = real(realData.clientId);
			new_enemy.roomId = realData.roomId;
			new_enemy.sharedProperties = realData.SP;
			new_enemy.afk = realData.afk
			new_enemy.entities =(realData.entities);
			new_enemy.entitiesOnServer =(realData.entitiesOnServer);
			
			try{
			//	new_enemy.sharedProperties = json_parse(new_enemy.sharedProperties)
				//new_enemy.sharedProperties.clientId = new_enemy.clientId
			//	new_enemy.sharedProperties = json_stringify(new_enemy.sharedProperties)
			}catch(e){}
			
			
		
		}
		break;
		
		
		case "pO_update":
		var found = false;
		with(oPersistentObject){
			if(id.persistentObjectId == realData.POid){
				
				id.persistentObjectProperties = realData.pOp
				found = true;
			}
		
			
		}
		if(!found){
			
			var new_pO = instance_create_layer(global.RNetSpawnPoints[2][0],global.RNetSpawnPoints[2][1],
			global.PersistentObjectsLayerName,oPersistentObject);
			new_pO.persistentObjectId = realData.POid;
			new_pO.persistentObjectProperties = realData.pOp
			new_pO.roomId = realData.roomId
		}
		break;
		
		
		case "disconnected":
		callback_DisconnectFromServer()
		break;
		
		case "destroy_player":
		//show_message(buffer_processed)
		with(oOtherPlayer){
			if(clientId==real(realData.clientId)){
				instance_destroy(id);
				
			}
		}
		with(oOtherPlayersEntity){
			if(clientId==real(realData.clientId)){
				instance_destroy(id);
				
			}
		}
		
		break;
		
		
		case "destroy_pO":
		with(oPersistentObject){
			if(persistentObjectId == realData.POid){
				instance_destroy(id)
			}
		}
		break;
		
		
		case "pong":
		global.ping = current_time - real(realData.ct)
		last_got_ping = current_time
		break;
		
		
		case "get_server_time":

		callback_GotServerTime(real(realData.time))
		break;
		
		
		case "SMTC":
		callback_ReceivedMessage(  realData.message , realData.senderClientId);
		break;
		
		case "SETC":
		callback_ReceivedEvent( realData.event , json_parse(realData.message) , realData.senderClientId);
		break;
		
		case "SEFC":
		callback_ReceivedEventFromServer( realData.event , json_parse(realData.message));
		break;
		
		
		case "created_PO":
		callback_CreatedPersistentObject(realData.POid)
		break;
		
		case "pseudoHost":
		var pseudoHostClientId = real(realData.pH)
		oBrain.pseudoHostClientId = real(realData.pH)
		if(pseudoHostClientId == global.clientId){
			oBrain.AmIPseudoHost = true
		}else{
			oBrain.AmIPseudoHost = false
		}
		break;
		
		
		case "full_server_view":
		callback_ViewServerActivity(realData.activity)
		break;
		
		case "db_summary":
		callback_GetServerSummary(realData.db)
		break;
		
		case "read_data":
		callback_ReadSimpleData(realData.readId,(realData.data));
		break;
		case "read_data_fail":
	
		callback_ReadSimpleData(realData.readId,-1);
		break;
		
		
		case "delete_data":
		callback_DeleteSimpleData(realData.deleteId,true);
		break;
		case "delete_data_fail":
		callback_DeleteSimpleData(realData.deleteId,false);
		break;
		
		
		case "write_data":
		callback_SetSimpleData(realData.writeId,true)
		break
		
		case "write_data_fail":
		callback_SetSimpleData(realData.writeId, false)
		break
		
		
		case "patch_data":
		callback_AddToSimpleData(realData.patchId,true)
		break
		
		case "patch_data_fail":
		callback_AddToSimpleData(realData.patchId, false)
		break
		
		
		
		case "callback_simple_ai":
		callback_CallSimpleAI(realData.callId, realData.threadId, true , realData.rM, realData.creditsUsed)
		var t = struct_get(oBrain.aiThreads, realData.threadId )
		t[array_length(t)] = {role: "assistant", content: realData.rM}
		struct_set(oBrain.aiThreads, realData.threadId, t)
		break;
		
		case "callback_simple_ai_fail":
		callback_CallSimpleAI(realData.callId, realData.threadId, false , "", 0)
		break;
		
		
		case "callback_general_ai":
		callback_CallGeneralAI(realData.callId, true , realData.rM, realData.creditsUsed)
		break;
		
		case "callback_general_ai_fail":
		callback_CallGeneralAI(realData.callId , false , "", 0)
		break;
		
		
		case "discord_message_create":

		callback_DiscordMessageReceived(realData.channelId , realData.author , realData.messageBody)
		break;
	}
	
	
	buffer_delete(buffer_raw)
}

