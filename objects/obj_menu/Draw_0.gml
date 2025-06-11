//draw menu box
draw_sprite_ext(spr_box, 0, x, y, width/sprite_width, height/sprite_height, 0, c_white, .75);
display_set_gui_size(320,180);
//draw menu items
draw_set_font(Font1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i=0; i < menu_item_length; i++) {
	draw_text(x + box_border, y + box_border + (item_vertical_spacing*i), menu_items[i]);
}