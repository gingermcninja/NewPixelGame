// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_menu(){
	
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
/*
all_menus = [ main_menu, fight_menu, magic_menu ];
*/