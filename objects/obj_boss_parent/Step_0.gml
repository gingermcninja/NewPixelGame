/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_dialog)) exit;

if (hp <= 0) {
	instance_destroy();
	obj_player.add_xp(xp_value);
}

/*
if(_hor != 0  or _ver != 0) {
 if (_hor > 0) sprite_index = run_right_sprite;
 else if (_hor < 0) sprite_index = run_left_sprite;
 else if (_ver != 0) {
	 if (sprite_index == idle_right_sprite) sprite_index = run_right_sprite;
	 else if (sprite_index == idle_left_sprite) sprite_index = run_left_sprite;
 }
}
else {
 if (sprite_index == run_left_sprite) sprite_index = idle_left_sprite;
 else if (sprite_index == run_right_sprite) sprite_index = idle_right_sprite;
}
*/