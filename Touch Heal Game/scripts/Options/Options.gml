// Settings    V2.1.0
// -- Updates in this version? 
//  - Full Discord Integration
//  - Perfectly synced objects in Smart Entities



/*
* Your server id or secret key. 
* This identifies your Rocket Net Server. You can manage all server ID's in your dashboard
* Please do not share with anyone!   Generate one or use one from the dashboard.
* Then there is the Game Id. To separate your games, use this feature.
*/
global.SERVERID = "cdbfcfda-b2ac-4867-b7fd-fa56186839f4"
global.gameId = "default"
global.discordServerId = "1213209657330634854"   //set this to the Discord Server ID (number as string) for this Game Project

/* Normally, data packets in websockets are safe because of SSL, but your game players can see the messages sent back and forth using tools like Chrome dev tools.
* Your SERVERID is never revealed over these messages, but they will contain the Sructs of shared properties etc tec
*  Ciphering will make it impossible to even understand these messages.
*/   // The catch is that Ciphering can make your game slow especially in HTML5, so use with caution!
global.useCiphering = false;
/*
* On which layer do you want other players and their instances and persistent objects to be instantiated
*/
global.OtherPlayersLayerName = "Instances"
global.OtherPlayerEntityLayerName = "Instances"
global.PersistentObjectsLayerName = "Instances"
global.RNetSpawnPoints = [               //Where would these instances be spawned? Set this to something like <-2000,-2000> so it is well outside any room so the player cant see it, and you can control and move then anywhere after that
[0,0],    //for oOtherPlayer      x,y
[0,0],    //for oOtherPlayerEntity      x,y
[0,0]     //for oPersistentObject         x,y 
]

/*
* Do you want to manually connect to RNet? You can do this by copying your serverURL directy
* from dashboard.rocketnetworking.net
*/
global.manualServerURLconnection = false;
global.manualServerURL = "server.rocketnetworking.net"


/*
* How often do you want to share your sharedProperties?
* The higher this Time period is in frames, thats how many frames later the server is updated
*/
global.sharingFrequency = 1 ;    //Equivalent to alarm of 1 frame
global.entitySharingFrequency = 3   //for entities


//Thank you for using Rocket Networking! See you on the moon :)