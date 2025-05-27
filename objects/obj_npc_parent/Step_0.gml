/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_dialog)) exit;

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) {
	can_talk = true;
	if (keyboard_check_pressed(input_key) || 
	(mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, id))) {
		create_dialog(dialog);
		
		if (final_npc) obj_dialog.next_room = true;
	}
}
else {
	can_talk = false;	
}