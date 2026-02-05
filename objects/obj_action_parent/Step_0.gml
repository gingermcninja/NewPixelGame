if (obj_battle_manager.control_state == ControlState.ActionSelection || 
			obj_battle_manager.control_state == ControlState.EnemySelection || 
			obj_battle_manager.control_state == ControlState.PlayerSelection)
{
	image_alpha = 1;
}
else {
	image_alpha = 0.2;
}