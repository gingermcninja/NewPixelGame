// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_shadow(_offset = 0, scale_w = 1, scale_h = 1){
	draw_sprite_ext(spr_shadow, 0, x, y + _offset, scale_w, scale_h, 0, -1, 0.4);
}

function convert_coordinates(x_input, y_input) {

	var cl = camera_get_view_x(view_camera[0])
	var ct = camera_get_view_y(view_camera[0])

	var off_x = x_input - cl // x is the normal x position
	var off_y = y_input - ct // y is the normal y position
	// convert to gui
	var off_x_percent = off_x / camera_get_view_width(view_camera[0])
	var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
	var gui_x = off_x_percent * display_get_gui_width()
	var gui_y = off_y_percent * display_get_gui_height()
	
	return [gui_x,gui_y];	
}