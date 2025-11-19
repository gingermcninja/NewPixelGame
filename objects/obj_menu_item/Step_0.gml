/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

visible = !obj_battle_manager.enemy_turn
if(visible) {
	_mx = device_mouse_x_to_gui(0)
	_my = device_mouse_y_to_gui(0)

	if !obj_battle_manager.enemy_turn {
		if point_in_rectangle(_mx, _my, x, y, x+width, y+height) {
			if mouse_check_button_pressed(mb_left) {
				show_debug_message(menu_data.title + " item clicked!")
				action()
			}
		}
	}
}