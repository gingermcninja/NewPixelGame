/// @description Insert description here
// You can write your code in this editor
//menu = all_menus;
//menu_items = [];

#macro ITEM_WIDTH 150
#macro ITEM_HEIGHT 184
draw_set_font(Font1);
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

width = 150;
height = 184;

_dx = x;
_dy = gui_h - height;

items = []

display = function() {
	for(var i = 0; i < menu_item_length; i++) {
		currentMenu = self;
		items[i] = instance_create_depth(_dx, _dy+(i*50), 0, obj_menu_item, {
			width: width,
			height: 50,
			_dx:_dx,
			_dy: _dy+(i*50),
			text: selected_menu.menu_items[i].title,
			type: selected_menu.menu_items[i].type,
			menu_data: selected_menu.menu_items[i],
			identifier: selected_menu.menu_items[i].identifier,
			owner: currentMenu
		});
		show_debug_message(selected_menu.menu_items[i].title + " menu item created, x = " + string(_dx));

	}
}

pos = 0;
//visible_at_launch = true;
visible = visible_at_launch;

//all_menus = global.all_menus

show_debug_message(selected_menu.identifier + " menu created, x = " + string(x));

box_border = 10;
item_vertical_spacing = 42;
menu_item_length = array_length(selected_menu.menu_items);
show_debug_message("menu_item_length = " + string(menu_item_length));
for(var i = 0; i < menu_item_length; i++) {
	title_length =  string_width(selected_menu.menu_items[i].title) + 10
	show_debug_message(selected_menu.menu_items[i].title + " length is " + string(title_length))
	if title_length > width {
		width = title_length;
	}
}

if visible {
	display()
}

closeSubMenus = function() {
	for(var i = 0; i < instance_number(obj_menu); ++i) {
		var menu = instance_find(obj_menu, i);
		if menu.x >= _dx+width {
			show_debug_message("Closing menu");
			instance_destroy(menu);
		}
	}
}
