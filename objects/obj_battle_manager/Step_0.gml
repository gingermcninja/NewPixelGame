if(action_in_progress) {
	show_debug_message("action in progress");	
}
/*
if(ds_queue_empty(turn_queue)) {
	show_debug_message("queue empty");	
}
*/
if(!action_in_progress && !ds_queue_empty(turn_queue)) {
	perform_next_action();	
}