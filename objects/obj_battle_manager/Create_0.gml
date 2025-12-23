enemy_turn = 0;
damage_to_enemy = 0;
attack_sound = pow;

gui_h = display_get_gui_height();

obj_initial_menu = instance_create_depth(0,0,-999,obj_menu, {
	_dy: gui_h - ITEM_HEIGHT*(array_length(global.main_menu.menu_items)),
	visible_at_launch: true,
	selected_menu: global.main_menu
});


player_attack = function(_damage, _sound) 
{
	action_target = obj_battle_enemy;
	damage_to_enemy = _damage;
	effect_quantifier = damage_to_enemy;
	attack_sound = _sound;
	enemy_turn = 1;
	alarm[0] = 40;	
	obj_battle_player.action_effect = instance_create_depth(obj_battle_enemy.x-30, obj_battle_enemy.y-5, -999, obj_action_effect, {
				visible: false,
				sprite_index: spr_battle_damage
			});
	
	obj_battle_player.alarm[0] = 10;
}

show_number = function() {
	x_adjustment = 775;
	y_adjustment = 200;
	num_color = c_white;
	if action_target == obj_battle_player {
		x_adjustment = 300;
		num_color = c_aqua;
	}
	instance_create_depth(action_target.x+x_adjustment, action_target.y+y_adjustment, -999, obj_battle_number, {
		effect_amount: effect_quantifier,
		num_color: num_color
	});
}

player_magic = function(_magic_identifier)
{
	spell = global.all_magic[$_magic_identifier]
	if (obj_battle_player.data.mp >= spell.cost) {
		if spell.target == "enemy" {
			action_target = obj_battle_enemy;
			action_effect = instance_create_depth(obj_battle_enemy.x-30, obj_battle_enemy.y-5, -999, obj_action_effect, {
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
		enemy_turn = 1;
		alarm[0] = 40;
		obj_battle_player.data.mp -= spell.cost;
		obj_battle_player.alarm[0] = 10;
	}
}

check_for_end = function ()
{
	return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0);
}
