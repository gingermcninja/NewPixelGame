/// @description Insert description here
// You can write your code in this editor
//menu = all_menus;
//menu_items = [];
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

width = 150;
height = 184;

_dx = 0;
_dy = gui_h - height;

pos = 0;

box_border = 10;
item_vertical_spacing = 42;
menu_item_length = array_length(global.main_menu.menu_items);

for(var i = 0; i < menu_item_length; i++) {
	var item = instance_create_depth(_dx, _dy+(i*50), 0, obj_menu_item);
	item.width = width;
	item.height = 50;
	item._dx = _dx;
	item._dy = _dy+(i*item.height); 
	item.text = global.main_menu.menu_items[i].title
	item.type = global.main_menu.menu_items[i].type
	item.identifier = global.main_menu.menu_items[i].identifier
}