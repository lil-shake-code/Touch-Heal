draw_self()
draw_healthbar(x-20,y-40,x+20,y-45, health , c_black, c_red,c_green, false, true , true)

draw_set_color(c_white)
draw_text(10, 20, "Press R to reduce health")

if(oldHealth<health){
	draw_set_color(c_yellow)
	draw_text(10, 40, "Increasing health!")
}else if(oldHealth<health){
	draw_set_color(c_yellow)
	draw_text(10, 40, "Reducing health!")
}

oldHealth= health


if(keyboard_check_pressed(ord("R"))){
	health-= 10;
}


draw_text(10, 60, "Press C to create a heart")

if(keyboard_check_pressed(ord("C"))){
	CreatePersistentObject(global.roomId, { "_x" : x , "_y" : y} )
	
}


draw_text(10, 80, "Press D to delete all hearts")

if(keyboard_check_pressed(ord("D"))){
	with(oPersistentObject){
		DestroyPersistentObject(id.persistentObjectId)
	}
	
}


// Movement for oPlayer
x += keyboard_check(vk_right) - keyboard_check(vk_left)
y -= keyboard_check(vk_up) - keyboard_check(vk_down)


global.sharedProperties = {
	_x : x,
	_y : y
}