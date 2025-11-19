/// @description Insert description here
// You can write your code in this editor

//draw_self();
if (obj_battle_manager.enemy_turn) {
	draw_set_color(c_ltgray);
} else {
	draw_set_color(c_gray);
}
draw_rectangle(_dx, _dy, _dx+width, _dy+height, true);
itemTitle = menu_data.title
if obj_battle_player.data.charge >= 1 && menu_data.identifier == "fight"
{
	itemTitle = itemTitle + " >>>";
}
draw_text(_dx,_dy,itemTitle);
