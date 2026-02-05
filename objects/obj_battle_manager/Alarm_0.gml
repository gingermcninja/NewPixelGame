
//target.data.hp -= damage_to_enemy;
action_target.take_damage(damage_to_enemy);


if (check_for_end()) {
	alarm[2] = 60;
	}
else {
	alarm[1] = 60;
	//action_target.alarm[0] = 30;
	action_in_progress = false;
	//perform_next_action();
}

obj_battle_player.data.charge += 0.4;
if(obj_battle_player.data.charge > 1) {
	obj_battle_player.data.charge = 1;
}