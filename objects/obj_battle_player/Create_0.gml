event_inherited()

data = obj_battle_switcher.player_data;
attack_finished = false;
wait_elapsed = 0;
charge_timer = -1;
move_timer = -1;


player_attack = function(_sound, _enemy, _heavy=false) 
{
	//action_target = _enemy;
	damage_to_enemy = data.damage;
	if(_heavy == true) {
		damage_to_enemy = damage_to_enemy*2;	
	}
	attack_sound = _sound;
	
	charge_timer = time_source_create(time_source_game,40,time_source_units_frames,increase_attack_charge);
	time_source_start(charge_timer);
	move_forward_after_delay(10);
	_enemy.take_damage_after_delay(damage_to_enemy, 40);
	action_effect = _enemy.create_action_effect(damage_to_enemy, spr_battle_damage);
	action_effect.start_effect_after_delay(30);
	
	action_data = {
		target: _enemy,
		quantity: data.damage,
		effect: action_effect
	}
}

player_magic = function(_magic_identifier, _enemy)
{
	spell = global.all_magic[$_magic_identifier]
	if (data.mp >= spell.cost) {
		if spell.target == ActionTarget.Enemy {
			//damage_to_enemy = spell.effect;
			//effect_quantifier = damage_to_enemy;
			//action_target = _enemy;
			action_effect = _enemy.create_action_effect(spell.effect, spell.animation);
			action_effect.start_effect_after_delay(30);
			_enemy.take_damage_after_delay(spell.effect,40);
		} else {
			//effect_quantifier = spell.effect;
			//action_target = self;
			action_effect = self.create_action_effect(spell.effect, spell.animation)
			action_effect.start_effect_after_delay(20);
			//damage_to_enemy = 0;
			
			data.hp += spell.effect;
			if data.hp > data.hp_total {
				data.hp = data.hp_total	
			}
		}
		action_effect = action_effect;
		attack_sound = spell.sound;
		
		data.mp -= spell.cost;
		move_forward_after_delay(10);
	}
}

get_effect_location = function() {
	return {x: x-35, y: y-40};	
}

move_forward_after_delay = function(_delay) {
	move_timer = time_source_create(time_source_game,_delay, time_source_units_frames, move_forward);
	time_source_start(move_timer);
}

move_back_after_delay = function(_delay) {
	move_timer = time_source_create(time_source_game,_delay, time_source_units_frames, move_back);
	time_source_start(move_timer);
}

move_forward = function()
{
	if(move_timer == -1) {
		time_source_destroy(move_timer);
	}

	attack_finished = false;
	x += 2;

	if (x > xstart + 20) {
		move_back_after_delay(1);
	}
	else
	{	
		move_forward_after_delay(1);
	}
}

move_back = function() {
	if(move_timer == -1) {
		time_source_destroy(move_timer);
	}
	x -= 2;
	if (x > xstart) {
		if(!attack_finished) {
			audio_play_sound(attack_sound, 0, false);
			attack_finished = true
			finish_action_after_delay(30);
		}
		move_back_after_delay(1);	
	}	
}

increment_battle_timer = function() {
	if(wait_elapsed < data.action_speed) {
		wait_elapsed += 0.02;
		if(wait_elapsed >= data.action_speed) {
			wait_elapsed = data.action_speed;
			ds_queue_enqueue(obj_battle_manager.turn_queue, self);
		}
	}	
}

increase_attack_charge = function() {
	data.charge += 0.4;
	if(data.charge > 1) {
		data.charge = 1;
	}
	if(charge_timer != -1) {
		time_source_destroy(charge_timer);
	}
}

reset_wait_timer = function() {
	wait_elapsed = 0;
}