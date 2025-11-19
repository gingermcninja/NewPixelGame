/// @description Insert description here
// You can write your code in this editor
//draw menu box

	draw_sprite_ext(spr_box, 0, _dx, _dy, width/sprite_width, height/sprite_height, 0, c_white, .75);

	//draw menu items
	draw_set_font(Font1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

/*
for(var i=0; i < menu_item_length; i++) {
	draw_text(_dx + box_border, _dy + box_border + (item_vertical_spacing*i), menu_items[i]);
}
*/
