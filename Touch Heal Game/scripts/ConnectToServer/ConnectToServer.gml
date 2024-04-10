
function ConnectToServer(){
	if(instance_exists(oBrain)){
	
		if(variable_instance_exists(oBrain, "waitingForURL")){
			oBrain.waitingForURL = true;
	
			if(!global.manualServerURLconnection){
				PreConnect()
			}else{
				var IP = global.manualServerURL
				var PORT=443
				if(IP == "localhost"){
					PORT = 3000
					oBrain.socket = network_create_socket(network_socket_ws)
				}else{
					oBrain.socket = network_create_socket(network_socket_wss)
				}
		
		
		
		
		
				show_debug_message("Set to "+IP+" at port "+string(PORT)+" assuming a safe wss connection.")

	
				show_debug_message("Trying to connect to your Rocket Server")
				oBrain.connect=network_connect_raw_async(oBrain.socket, IP,PORT)
				show_debug_message("connect is "+string(oBrain.connect))
			}
		
		
		
		}else{
			var _handle = call_later(10, time_source_units_frames, ConnectToServer);
		}
		
		
	}else{
		var _handle = call_later(10, time_source_units_frames, ConnectToServer);
	}


}