/// @description Insert description here
// You can write your code in this editor

x += 2;
if (x < xstart) {
	alarm[1] = 1;
} else {
	var _enemy_damage = data.damage * random_range(0.7, 1.2);
	obj_battle_player.data.hp -= _enemy_damage;
	obj_battle_manager.action_in_progress = false;
	wait_elapsed = 0;
	//obj_battle_manager.perform_next_action();	
}