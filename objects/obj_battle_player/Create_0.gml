event_inherited()

data = obj_battle_switcher.player_data;
attack_finished = false;
wait_elapsed = 0;


player_attack = function(_sound, _enemy, _heavy=false) 
{
	action_target = _enemy;
	obj_battle_manager.action_target = _enemy;
	damage_to_enemy = data.damage;
	if(_heavy == true) {
		damage_to_enemy = damage_to_enemy*2;	
	}
	attack_sound = _sound;
	
	obj_battle_manager.alarm[0] = 40;
	alarm[3] = 40;
	_enemy.take_damage_after_delay(damage_to_enemy, 40);
	action_effect = _enemy.create_action_effect(damage_to_enemy, spr_battle_damage);
	move_forward_after_delay(10);
	
}

player_magic = function(_magic_identifier, _enemy)
{
	spell = global.all_magic[$_magic_identifier]
	if (data.mp >= spell.cost) {
		if spell.target == ActionTarget.Enemy {
			damage_to_enemy = spell.effect;
			effect_quantifier = damage_to_enemy;
			action_target = _enemy;
			action_effect = _enemy.create_action_effect(damage_to_enemy, spell.animation);
			_enemy.take_damage_after_delay(damage_to_enemy,40);
		} else {
			effect_quantifier = spell.effect;
			action_target = self;
			action_effect = self.create_action_effect(effect_quantifier, spell.animation)

			damage_to_enemy = 0;
			
			data.hp += effect_quantifier;
			if data.hp > data.hp_total {
				data.hp = data.hp_total	
			}
		}
		action_effect = action_effect;
		attack_sound = spell.sound;
		
		obj_battle_manager.alarm[0] = 40;
		data.mp -= spell.cost;
		alarm[0] = 10;
	}
}

get_effect_location = function() {
	return {x: x-35, y: y-40};	
}

move_forward_after_delay = function(_delay) {
	alarm[0] = _delay;
}

move_back_after_delay = function(_delay) {
	alarm[1] = _delay;	
}

move_forward = function()
{
	
	attack_finished = false;
	x += 2;

	if (x > xstart + 20) {
		
		if action_effect != -1 {
			action_effect.image_index = 0;
			action_effect.visible = true;
		}
	}
	else
	{	
		move_forward_after_delay(1);	
	}
}

move_back = function() {
	x -= 2;
	if (x > xstart) {
		if(!attack_finished) {
			audio_play_sound(attack_sound, 0, false);
			attack_finished = true
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
}