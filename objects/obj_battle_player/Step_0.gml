if(wait_elapsed < data.action_speed) {
	wait_elapsed += 0.02;
	if(wait_elapsed >= data.action_speed) {
		wait_elapsed = data.action_speed;
		ds_queue_enqueue(obj_battle_manager.turn_queue, self);
		//obj_battle_manager.control_state = ControlState.ActionSelection;
		
		//obj_battle_manager.show_menu();
	}
}