/// @description Insert description here
// You can write your code in this editor
draw_self();

if (can_talk && !instance_exists(obj_dialog)) {
	draw_sprite(spr_talk, 0, x+4, y - 4);
}