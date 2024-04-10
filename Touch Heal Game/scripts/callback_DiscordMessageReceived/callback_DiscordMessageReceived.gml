function callback_DiscordMessageReceived(channelId , authorStruct , messageBody){
	show_message("Received a message "+messageBody+" from author")
	show_message(typeof(authorStruct))
	show_message(authorStruct)

}