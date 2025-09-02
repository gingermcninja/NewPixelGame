/// @description Insert description here
// You can write your code in this editor
text = ""
type = ""
identifier = ""
_dx = 0;
_dy = 100;
width = 100;
height = 20;
show_debug_message("item created!");

action = function() {
	show_debug_message("item clicked!");
	if(type == "action") {
		if(identifier == "fight") {
			obj_battle_manager.player_attack(obj_battle_player.data.damage, pow);	
		}
		else if(identifier == "flee") {
			audio_play_sound(flee, 0, false);
			room_goto(obj_battle_switcher.original_room);
		}
	}
}
