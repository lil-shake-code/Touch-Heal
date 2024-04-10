
function callback_Admin(alert_message){
	
	//This is a callback when your RNet server really has to announce something like
	//  "MAX CAPACITY REACHED"
	//  Hide this from your players!
	
	show_message(alert_message+" This alert came from callback_Admin function. Please hide this in production!")

	switch(alert_message){
		
		case "INVALID_SERVER_ID":
		break;
		
		//other cases
	
	}

}