
function PreConnect(){
	

		var url = "https://us-central1-rocket-networking.cloudfunctions.net/getServerUrl";

		var headers = ds_map_create();
		headers[?"Content-Type"] = "application/x-www-form-urlencoded";


		http_request(url, "POST" , headers , md5_string_utf8(global.SERVERID)) //http_post_string(url,json_stringify(data))
	
		show_debug_message("Asking RNet backend to give us our server information from bckend..")

	
		global.clientId = -1 //not set anything yet
		global.roomId = -1 //not set anything yet

		ds_map_destroy(headers)
	

}