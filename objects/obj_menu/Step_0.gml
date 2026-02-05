/// @description Insert description here
// You can write your code in this editor

//visible = !obj_battle_manager.enemy_turn
visible = (obj_battle_manager.control_state == ControlState.ActionSelection || 
			obj_battle_manager.control_state == ControlState.EnemySelection || 
			obj_battle_manager.control_state == ControlState.PlayerSelection);
