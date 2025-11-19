/// @description Insert description here
// You can write your code in this editor


show_debug_message("item created - owner is " + owner.selected_menu.identifier);

fightMenuOpen = false
padding = 20

action = function() {
	show_debug_message("item clicked!");
	
	owner.closeSubMenus();
	
	if(menu_data.type == "action") {	
		if(menu_data.identifier == "fight") {
			if obj_battle_player.data.charge >= 1 && !fightMenuOpen {
				show_debug_message("Opening fight menu");
				instance_create_depth(width, 0, -999, obj_menu, {
					_dy: _dy,
					visible_at_launch: true,
					selected_menu: global.fight_menu,
					parent_menu: owner
				});
				fightMenuOpen = true;
			} else {
				obj_battle_manager.player_attack(obj_battle_player.data.damage, pow);
				owner.closeSubMenus();
				fightMenuOpen = false;
			}
		}
		else if(menu_data.identifier == "flee") {
			audio_play_sound(flee, 0, false);
			room_goto(obj_battle_switcher.original_room);
			owner.closeSubMenus();
		}
		else if(menu_data.identifier == "heavy_attack") {
			obj_battle_player.data.charge = 0;
			obj_battle_manager.player_attack(obj_battle_player.data.damage * 2, p_pow);	
			owner.parent_menu.closeSubMenus();
			fightMenuOpen = false;

		}

	}
	else if (menu_data.type == "menu") {
		if(menu_data.identifier == "magic") {
			instance_create_depth(width, 0, -999, obj_menu, {
				_dy: owner._dy,
				visible_at_launch: true,
				selected_menu: global.magic_menu,
				parent_menu: owner
			});	
		}
	}

}

