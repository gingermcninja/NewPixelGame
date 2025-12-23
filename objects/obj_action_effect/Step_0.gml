/// @description Insert description here
// You can write your code in this editor

if (visible && image_index >= image_number-1) {
	//completion();
	obj_battle_manager.show_number();
	obj_battle_player.alarm[1] = 1;
	instance_destroy();	
}