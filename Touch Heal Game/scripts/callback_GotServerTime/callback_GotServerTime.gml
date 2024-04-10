function callback_GotServerTime(time){
	//Note that time is in milliseconds from 1972!
	// This widely used format is called the epoch time.
	
	//You can use this to sync your client game clock with the server
	//This can be useful in battle royale games
	
	
	var secondsOnServer = floor(time/1000)
	
	var countdownTimer = secondsOnServer mod 60
	
	

}