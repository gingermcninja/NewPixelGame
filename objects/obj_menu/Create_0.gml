/// @description Insert description here
// You can write your code in this editor
//menu = all_menus;
//menu_items = [];

#macro ITEM_WIDTH 150
#macro ITEM_HEIGHT 184

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

width = 150;
height = 184;

_dx = x;
_dy = gui_h - height;

display = function() {
	for(var i = 0; i < menu_item_length; i++) {
		var item = instance_create_depth(_dx, _dy+(i*50), 0, obj_menu_item);
		item.width = width;
		item.height = 50;
		item._dx = _dx;
		item._dy = _dy+(i*item.height); 
		item.text = selected_menu.menu_items[i].title
		item.type = selected_menu.menu_items[i].type
		item.menu_data = selected_menu.menu_items[i];
		item.identifier = selected_menu.menu_items[i].identifier
	}
}

pos = 0;
visible = visible_at_launch;

all_menus = global.all_menus
selected_menu = global.main_menu
for(var i = 0; i < array_length(all_menus); i++) {
	if(all_menus[i].identifier == identifier) {	
		selected_menu = all_menus[i];
	}
}
show_debug_message(selected_menu.identifier + " menu created, x = " + string(x));

box_border = 10;
item_vertical_spacing = 42;
menu_item_length = array_length(selected_menu.menu_items);

if visible {
	display()
}

