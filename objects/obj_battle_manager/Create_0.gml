//damage_to_enemy = 0;

enemy_x_pos = [180, 200, 220, 245, 265];
enemy_y_pos = [40, 70, 100, 50, 80];
enemies = [];

turn_queue = ds_queue_create();
xp_earned = 0;

end_battle_timer = -1;
check_for_end_timer = -1;

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
				if(array_contains(enemies, next_up.id)) {
					show_debug_message("enemy turn");
					action_in_progress = true;
					next_up.move_forward_after_delay(30);
				} else {
					show_debug_message("enemy " + next_up.id + " in queue not found - probably dead");	
				}
			}
		}
	}
}

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
			obj_battle_player.player_attack(pow, _target, false);
		}
		else if(_action.identifier == "heavy_attack") {
			obj_battle_player.player_attack(p_pow, _target, true);
		}
		else if(_action.identifier == "cure1" || _action.identifier == "fire1" || _action.identifier == "ice1" || _action.identifier == "lightning1") {
			obj_battle_player.player_magic(_action.identifier, _target);
		}
		obj_battle_player.reset_wait_timer()
		control_state = ControlState.Wait;
	}
}

remove_enemy = function(_enemy) {
	for(var i = 0; i < array_length(enemies); i++) {
		if(enemies[i] == _enemy) {
			xp_earned += _enemy.data.xp_value;
			array_delete(enemies, i, 1);
			instance_destroy(_enemy);
			check_for_end_after_delay(10);
		}
	}	
}

check_for_end_after_delay = function(_delay) {
	check_for_end_timer = time_source_create(time_source_game,_delay,time_source_units_frames, check_for_end)
	time_source_start(check_for_end_timer);
}

check_for_end = function ()
{
	if(check_for_end_timer != -1) {
		time_source_destroy(check_for_end_timer);	
	}
	
	if (array_length(enemies) == 0 || obj_battle_player.data.hp <= 0) {
		end_battle_timer = time_source_create(time_source_game,60,time_source_units_frames,end_battle);
		time_source_start(end_battle_timer);
	} else {
		action_in_progress = false;
	}

}


end_battle = function () {
	if(end_battle_timer != -1) {
		time_source_destroy(end_battle_timer);
	}
	obj_battle_switcher.enemy_data.hp = 0;
	if(array_length(enemies) == 0) {
		obj_battle_player.data.xp += xp_earned;	
	}
	room_goto(obj_battle_switcher.original_room);
}