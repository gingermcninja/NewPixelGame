/// @description Insert description here
// You can write your code in this editor
if ((obj_battle_manager.control_state == ControlState.ActionSelection || 
		obj_battle_manager.control_state == ControlState.EnemySelection || 
		obj_battle_manager.control_state == ControlState.PlayerSelection) &&
		obj_battle_player.data.charge >= 1) {
	image_alpha = 1;
}
else {
	image_alpha = 0.2;
}