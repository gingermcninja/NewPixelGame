owner = -1;
action_number = 0;
effect_timer = -1;

start_effect_after_delay = function(_delay) {
	effect_timer = time_source_create(time_source_game, _delay, time_source_units_frames, show_effect);
	time_source_start(effect_timer);
}

show_effect = function() {
	if(effect_timer != -1) {
		time_source_destroy(effect_timer);	
	}
	image_index = 0;
	visible = true;
}