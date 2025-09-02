/// @description Insert description here
// You can write your code in this editor
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

for(var i = 0; i < menu_item_length; i++) {
	itemId =itemArray[i]
	item = instance_find(obj_menu_item, i);
	_mx = device_mouse_x_to_gui(0)
	_my = device_mouse_y_to_gui(0)

	if point_in_rectangle(_mx, _my, item._dx, item._dy, item._dx+item.width, item._dy+item.height) {
		if mouse_check_button(mb_left) {
			item.action()
		}
	}
}

