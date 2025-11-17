// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_menu(_x, _y, _options, _description = -1) {
	with (instance_create_depth(_x, _y, -999, oMenu)) {
		options = _options;
		description = _description;
		optionsCount = array_length(_options);
		hoverMarker = "* ";
		
		margin = 8;
		draw_set_font(Font1);
		
		width = 1;
		if (_description != -1) { 
			width = max(width, string_width(_description));
		}
		for (var i = 0; i < optionsCount; i++) {
			width = max(width, string_width(options[i][0]));	
		}
		width += string_width(hoverMarker);
		
		heightLine = 17;
		height = heightLine * (optionsCount + !(description == -1));
		
		widthFull = width + (margin * 2);
		heightFull = height + (margin * 2);
		
	}
}

main_menu = {
	identifier: "main",
	menu_items: [
		{
			title: "Fight",
			type: "action",
			identifier: "fight"
		},
		{
			title: "Magic",
			type: "menu",
			identifier: "magic"
		},
		{
			title: "Flee",
			type: "action",
			identifier: "flee"
		},
		{
			title: "Item",
			type: "menu",
			identifier: "item"
		}
	]
}

fight_menu = {
	identifier: "fight",
	menu_items: [
		{
			title: "Attack",
			type: "action",
			identifier: "attack",
		},
		{
			title: "Heavy Attack",
			type: "action",
			identifier: "heavy_attack",
		}
	]
}
	
magic_menu = {
	identifier: "magic",
	menu_items: [
		{
			title: "Fire",
			type: "action",
			identifier: "fire",
		},
		{
			title: "Ice",
			type: "action",
			identifier: "ice",
		},
		{
			title: "Lightning",
			type: "action",
			identifier: "lightning",
		}
	]
}

all_menus = [ main_menu, fight_menu, magic_menu ];
