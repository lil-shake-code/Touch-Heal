/// @description Update this entity as much as you want

/*
* Update this struct
*/

entityProperties = {
	
	//Add stuff here like type / x / y / whatever
	_x : x,
	_y : y


}





//If you are using server side scripting... otherwise please dont use the code below
// If we get Server Side Entity Properties what to do?
try{
var EPS = json_parse(entityPropertiesFromServer)

    // x = real(EPS._x)
    // y = real(EPS._y)


}catch(e){
//show_debug_message(e)
}


















