/// @description Insert description here
// You can write your code in this editor
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

for(var i = 0; i < menu_item_length; i++) {
	item = array_get(itemArray, i)
	
	message = "mouse_x: " + string(mouse_x) + ", mouse_y: " + string(mouse_y) + ", menu x: " + string(x) + ", menu y: " + string(y) + ", item x: " + string(item.x) + ", item y: " + string(item.y) + ", i: " + string(i)
	show_debug_message(message)
	
	if point_in_rectangle(mouse_x, mouse_y, _dx, _dy+(i*50), _dx+width, _dy+(i*50)+50) {
		if mouse_check_button(mb_left) {
			show_debug_message("CLICK!")
		}
	}
}

