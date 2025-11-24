/// @description Insert description here
// You can write your code in this editor
attack_finished = false;
x += 2;

if (x > xstart + 20) {
	if action_effect != -1 {
		action_effect.image_index = 0;
		action_effect.visible = true;
	}
	//action_effect.completion = alarm[1];
	//alarm[1] = 1;
}
else
{
	alarm[0] = 1;	
}