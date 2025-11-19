/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < array_length(items); i++) {
	show_debug_message("Destroying menu item " + items[i].menu_data.title)
	instance_destroy(items[i]);
}
