/// @description Insert description here
// You can write your code in this editor

itemTitle = menu_data.title
if obj_battle_player.data.charge >= 1 && menu_data.identifier == "fight"
{
	itemTitle = itemTitle + " >";
}
draw_set_colour(c_white);
draw_text(_dx+ITEM_BORDER,_dy,itemTitle);
