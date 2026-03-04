/// @description Insert description here
// You can write your code in this editor
action_effect = -1;
damage_to_take = 0;

show_number = function(_action_number) {
	adjustments = convert_coordinates(x+(sprite_width/4), y)
	num_color = get_number_color();

	instance_create_depth(adjustments[0], adjustments[1], -999, obj_battle_number, {
		effect_amount: _action_number,
		num_color: num_color
	});
}

create_action_effect = function(_action_number, _sprite) {
	effect_location = get_effect_location()
	action_effect = instance_create_depth(effect_location.x, effect_location.y, -999, obj_action_effect, {
		visible: false,
		sprite_index: _sprite,
	});	
	action_effect.owner = self;
	action_effect.action_number = _action_number;
	return action_effect;
}

get_effect_location = function() {
	return {x: x-30, y: y-5};	
}

get_number_color = function() {
	return c_white;	
}

take_damage_after_delay = function(_damage, _delay) {
	damage_to_take = _damage
	alarm[2] = _delay;
}

take_damage = function(_damage_amount) {
	data.hp -= _damage_amount;
}