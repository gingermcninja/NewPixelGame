//enemy_turn = 0;
damage_to_enemy = 0;
attack_sound = pow;

enemy_x_pos = [180, 200, 220, 245, 265];
enemy_y_pos = [40, 70, 100, 50, 80];
enemies = [];

turn_queue = ds_queue_create();
xp_earned = 0;

obj_battle_indicator.visible = false;

enum ControlState {
	ActionSelection,
	EnemySelection,
	PlayerSelection,
	PlayerActionInProgress,
	EnemyActionInProgress,
	Wait
}

create_enemies = function(_num_enemies) {
	for(var i = 0; i < _num_enemies; i++) {
		var enemy_data = {
			hp: obj_battle_switcher.enemy_data.hp,
			hp_total: obj_battle_switcher.enemy_data.hp_total,
			idle_left_sprite: obj_battle_switcher.enemy_data.idle_left_sprite,
			type_index: obj_battle_switcher.enemy_data.type_index,
			damage: obj_battle_switcher.enemy_data.damage,
			action_speed: obj_battle_switcher.enemy_data.action_speed,
			xp_value: obj_battle_switcher.enemy_data.xp_value
		}
		enemies[i] = instance_create_depth(enemy_x_pos[i],enemy_y_pos[i], -999, obj_battle_enemy, {
			data: enemy_data
		});
	}

}

control_state = ControlState.Wait;
number_of_enemies = irandom_range(1, 5);

create_enemies(number_of_enemies);
selected_action = 0;

obj_initial_menu = instance_create_depth(0,0,-999,obj_menu, {
	_dy: display_get_gui_height() - MENU_ITEM_HEIGHT*(array_length(global.main_menu.menu_items)),
	visible_at_launch: true,
	selected_menu: global.main_menu
});

action_in_progress = false;
perform_next_action = function() {
	if(!ds_queue_empty(turn_queue)) {
		show_debug_message("next turn...");
		next_up = ds_queue_dequeue(turn_queue);	
		if(instance_exists(next_up)) {
			if(next_up.object_index == obj_battle_player) {
				show_debug_message("players turn");
				control_state = ControlState.ActionSelection
			} else {
				show_debug_message("enemy turn");
				action_in_progress = true;
				next_up.alarm[0] = 30;
			}
		}
	}
}
/*
player_attack = function(_damage, _sound, _enemy) 
{
	action_target = _enemy;
	damage_to_enemy = _damage;
	effect_quantifier = damage_to_enemy;
	attack_sound = _sound;
	//enemy_turn = 1;
	alarm[0] = 40;
	obj_battle_player.action_effect = instance_create_depth(action_target.x-30, action_target.y-5, -999, obj_action_effect, {
				visible: false,
				sprite_index: spr_battle_damage
			});
	
	obj_battle_player.alarm[0] = 10;
	
}
*/
/*
show_number = function() {
	adjustments = convert_coordinates(action_target.x+(action_target.sprite_width/4), action_target.y)
	num_color = c_white;
	if action_target == obj_battle_player {
		num_color = c_aqua;
	}
	instance_create_depth(adjustments[0], adjustments[1], -999, obj_battle_number, {
		effect_amount: effect_quantifier,
		num_color: num_color
	});

}
*/
action_selected = function(_action) {
	action_in_progress = true;
	selected_action = _action;
	if(_action.identifier == "cure1") {
		start_player_choice();
	} else {
		start_enemy_choice();
	}
}

start_enemy_choice = function() {
	control_state = ControlState.EnemySelection;
}

start_player_choice = function() {
	control_state = ControlState.PlayerSelection;
}

player_selected = function(_target) {
	process_action(selected_action, _target);
}

enemy_selected = function(_enemy) {
	process_action(selected_action, _enemy);
}

process_action = function(_action, _target) {
	if(_action.type == "action") {	
		if(_action.identifier == "fight") {
				//player_attack(obj_battle_player.data.damage, pow, _enemy);
				obj_battle_player.player_attack(pow, _target, false);
		}
		else if(_action.identifier == "heavy_attack") {
			//player_attack(obj_battle_player.data.damage * 2, p_pow, _enemy);
			obj_battle_player.player_attack(pow, _target, true);

		}
		else if(_action.identifier == "cure1" || _action.identifier == "fire1" || _action.identifier == "ice1" || _action.identifier == "lightning1") {
			//player_magic(_action.identifier, _enemy);
			obj_battle_player.player_magic(_action.identifier, _target);
		}
		obj_battle_player.wait_elapsed = 0;
		control_state = ControlState.Wait;
	}
}

/*
player_magic = function(_magic_identifier, _enemy)
{
	obj_battle_player.player_magic(_magic_identifier, _enemy);
	
	spell = global.all_magic[$_magic_identifier]
	if (obj_battle_player.data.mp >= spell.cost) {
		if spell.target == ActionTarget.Enemy {
			action_target = _enemy;
			action_effect = instance_create_depth(action_target.x-30, action_target.y-5, -999, obj_action_effect, {
				visible: false,
				sprite_index: spr_battle_damage
			});
			damage_to_enemy = spell.effect;
			effect_quantifier = damage_to_enemy;
		} else {
			action_target = obj_battle_player;
			action_effect = instance_create_depth(obj_battle_player.x-35, obj_battle_player.y-40, -999, obj_action_effect, {
				visible: false,
				sprite_index: cure1
			});

			damage_to_enemy = 0;
			effect_quantifier = 2;
			obj_battle_player.data.hp += effect_quantifier;
			if obj_battle_player.data.hp > obj_battle_player.data.hp_total {
				obj_battle_player.data.hp = obj_battle_player.data.hp_total	
			}
		}
		obj_battle_player.action_effect = action_effect;
		attack_sound = spell.sound;
		//enemy_turn = 1;
		alarm[0] = 40;
		obj_battle_player.data.mp -= spell.cost;
		obj_battle_player.alarm[0] = 10;
	}
	
}
*/

remove_enemy = function(_enemy) {
	for(var i = 0; i < array_length(enemies); i++) {
		if(enemies[i] == _enemy) {
			array_delete(enemies, i, 1);
			instance_destroy(_enemy);
		}
	}	
}

check_for_end = function ()
{
	//action_target = instance_find(obj_battle_enemy, 0);
	var enemies_defeated = true;
	for(var i = 0; i < array_length(enemies); i++) {
		if(enemies[i].data.hp <= 0) {
			defeated = enemies[i];
			xp_earned += defeated.data.xp_value;
			array_delete(enemies, i, 1);
			instance_destroy(defeated);
		} else {
			enemies_defeated = false;	
		}
	}
	return (array_length(enemies) == 0 || obj_battle_player.data.hp <= 0);
}
