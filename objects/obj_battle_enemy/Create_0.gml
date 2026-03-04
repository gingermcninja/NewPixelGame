event_inherited()
//data = variable_clone(obj_battle_switcher.enemy_data);
//data.hp = variable_clone(obj_battle_switcher.enemy_data.hp);
sprite_index = data.idle_left_sprite;
if data.type_index == 4 {
	x-=10
	y-=24
}

wait_elapsed = 0;


take_damage = function(_damage_amount) {
	data.hp -= _damage_amount;
	if(data.hp <= 0) {
		obj_battle_manager.remove_enemy(self);
	}
}


attack_player = function() {
	alarm[0] = 1;
}