

	show_debug_message("!!enemy count {0}", instance_number(obj_battle_enemy));
	show_debug_message("target hp: {0}", action_target.data.hp);
	show_debug_message("enemy2 hp: {0}", action_target.data.hp);


//target.data.hp -= damage_to_enemy;
new_hp = action_target.data.hp - damage_to_enemy

action_target.take_damage(damage_to_enemy);

	show_debug_message("!!!enemy count {0}", instance_number(obj_battle_enemy));
	show_debug_message("target hp: {0}", action_target.data.hp);
	show_debug_message("enemy2 hp: {0}", enemy_2.data.hp);

if (check_for_end()) {
	alarm[2] = 60;
	}
else {
	alarm[1] = 60;
	action_target.alarm[0] = 30;
}

obj_battle_player.data.charge += 0.4;
if(obj_battle_player.data.charge > 1) {
	obj_battle_player.data.charge = 1;
}