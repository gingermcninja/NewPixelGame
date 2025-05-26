// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_shadow(_offset = 0){
	draw_sprite_ext(spr_shadow, 0, x, y + _offset, 1, 1, 0, -1, 0.4);
}