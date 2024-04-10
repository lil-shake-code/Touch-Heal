/// @description What this smart entity has?


clientId = global.clientId; //this is your entity, like a bullet
oBrain.entitiesCreated++;
entityId = oBrain.entitiesCreated
array_push(oBrain.entitiesActive , entityId);




entityProperties = ({})
__smart__ = true  //do not remove this

//Put your personal variables down here, they will all be replicated for other clients
// To share a built-in variable,
// Create another variable with 3 underscores like ___x and always set it to the original built in variable

___x = 0
___y = 0
___image_angle = 0