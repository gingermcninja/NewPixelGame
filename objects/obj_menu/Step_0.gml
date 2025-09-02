/// @description Insert description here
// You can write your code in this editor
var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)

for(var i = 0; i < menu_item_length; i++) {	
	var item = instance_find(obj_menu_item, i);

	if point_in_rectangle(_mx, _my, item._dx, item._dy, item._dx+item.width, item._dy+item.height) {
		if mouse_check_button(mb_left) {
			item.action()
		}
	}
}

