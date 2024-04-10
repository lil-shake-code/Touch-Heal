/// @description Put your other player code here
try{
if(sharedProperties!=-1){
var SP = json_parse(sharedProperties)

/*
This is every instance of another player in the room you are in
You can use the key-value pairs in shared properties
to do stuff here. For starters, try updating
x = SP._x
y = SP._y
or whatever you want to update in any way from
your sharedProperties
*/


	x = real(SP._x)
	y = real(SP._y)

	enemyHealth = real(SP._H)
















//DO NOT PUT YOUR CODE AFTER THIS LINE
}
}catch(e){

	show_debug_message("Error in oOtherPlayer Step. This can be temporary but if it keeps repeating, check your code!")
	show_debug_message(e)
}

//If you are using server side scripting... otherwise please dont use the code below
try{
	
if(sharedPropertiesFromServer!=-1){
	var SPS = json_parse(sharedPropertiesFromServer)
	//add your code here...





}


}catch(e){
		show_debug_message("Error in oOtherPlayer Step Server side properties. This can be temporary but if it keeps repeating, check your code!")
	show_debug_message(e)
	
}
