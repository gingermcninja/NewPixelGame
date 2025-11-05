/// @description Insert description here
// You can write your code in this editor
text = ""
type = ""
identifier = ""
_dx = 0;
_dy = 100;
width = 100;
height = 20;
menu_data = {};
show_debug_message("item created!");

action = function() {
	show_debug_message("item clicked!");
	if(menu_data.type == "action") {
		if(menu_data.identifier == "fight") {
			obj_battle_manager.player_attack(obj_battle_player.data.damage, pow);
		}
		else if(menu_data.identifier == "flee") {
			audio_play_sound(flee, 0, false);
			room_goto(obj_battle_switcher.original_room);
		}
	}
}
