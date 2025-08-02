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
	obj_battle_manager.player_attack(obj_battle_player.data.damage, pow);	
}