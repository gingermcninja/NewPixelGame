/// @description Insert description here
// You can write your code in this editor


var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_enemy_parent]);

if (hp <= 0) {
	instance_destroy();
}

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