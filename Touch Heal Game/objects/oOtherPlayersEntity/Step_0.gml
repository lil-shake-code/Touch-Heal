/// @description Do something with this entity
try{
if(entityProperties!=-1){
var EP = json_parse(entityProperties)

/*
This is every instance of another entity in the room you are in
You can use the key-value pairs in these properties
to do stuff here. For starters, try updating
x = SP._x
y = SP._y
or whatever you want to update in any way from
your entityProperties
*/


	//x = real(EP._x)
	//y = real(EP._y)
	
	
	
	
	
	
	
	


}
}catch(e){

	show_debug_message("Error in oOtherPlayersEntity Step. This can be temporary but if it keeps repeating, check your code!")
	show_debug_message(e)
}



//If you are using server side scripting... otherwise please dont use the code below

try{

	var EPS = json_parse(entityPropertiesFromServer)

	//x = real(EPS._x)
	//y = real(EPS._y)


}catch(e){}
//DO NOT PUT YOUR CODE AFTER THIS LINE

