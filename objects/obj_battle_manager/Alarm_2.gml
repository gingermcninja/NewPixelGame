obj_battle_switcher.enemy_data.hp = 0;
if(array_length(enemies) == 0) {
	obj_battle_player.data.xp += xp_earned;	
}
room_goto(obj_battle_switcher.original_room);