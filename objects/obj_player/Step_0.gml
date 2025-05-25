/// @description Insert description here
// You can write your code in this editor

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver * move_speed, tile_map);

if(_hor != 0  or _ver != 0) {
 if (_hor > 0) sprite_index = player_run_right;
 else if (_hor < 0) sprite_index = player_run_left;
 else if (_ver != 0) {
	 if (sprite_index == player_idle_right) sprite_index = player_run_right;
	 else if (sprite_index == player_idle_left) sprite_index = player_run_left;
 }
}
else {
 if (sprite_index == player_run_left) sprite_index = player_idle_left;
 else if (sprite_index == player_run_right) sprite_index = player_idle_right;
}

if (hp <= 0) {
	game_restart();
}