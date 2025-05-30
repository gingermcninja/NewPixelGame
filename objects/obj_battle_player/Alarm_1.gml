/// @description Insert description here
// You can write your code in this editor

x -= 2;
if (x > xstart) {
	if(!attack_finished) {
		audio_play_sound(obj_battle_manager.attack_sound, 0, false);
		attack_finished = true
	}
	alarm[1] = 1;	
}