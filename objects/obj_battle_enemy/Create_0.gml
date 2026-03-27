event_inherited();
move_timer = -1;

sprite_index = data.idle_left_sprite;
if data.type_index == 4 {
	x-=10
	y-=24
}

wait_elapsed = 0;


take_damage = function(_damage_amount) {
	data.hp -= _damage_amount;
	if(data.hp <= 0) {
		obj_battle_manager.remove_enemy(self.id);
	}
}

attack_player = function() {
	move_forward_after_delay(1);
}

move_forward_after_delay = function(_delay) {
	move_timer = time_source_create(time_source_game,_delay,time_source_units_frames,move_forward);
	time_source_start(move_timer);
}

move_back_after_delay = function(_delay) {
	move_timer = time_source_create(time_source_game,_delay,time_source_units_frames,move_back);
	time_source_start(move_timer);
}

move_forward = function() {
	if(move_timer != -1) {
		time_source_destroy(move_timer)
	}
	x -= 2;

	if (xstart - x > 20) {
		move_back_after_delay(1);
	}
	else {
		move_forward_after_delay(1);
	}
}

move_back = function() {
	if(move_timer != -1) {
		time_source_destroy(move_timer)
	}
	x += 2;
	if (x < xstart) {
		move_back_after_delay(1)
	} else {
		var _enemy_damage = round(data.damage * random_range(0.7, 1.2));
		
		obj_battle_player.take_damage(_enemy_damage);
		action_effect = obj_battle_player.create_action_effect(_enemy_damage, spr_battle_damage);
		action_effect.image_index = 0;
		action_effect.visible = true;

		finish_action_after_delay(10);

		wait_elapsed = 0;
	}
}
