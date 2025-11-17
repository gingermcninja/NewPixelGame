enemy_turn = 0;
damage_to_enemy = 0;
attack_sound = pow;
player_attack = function(_damage, _sound) 
{
	obj_enemy_damage = instance_create_depth(obj_battle_enemy.x-30, obj_battle_enemy.y-5, -999, obj_battle_damage);
	damage_to_enemy = _damage;
	attack_sound = _sound;
	enemy_turn = 1;
	alarm[0] = 40;
	
	obj_battle_player.alarm[0] = 10;
}

check_for_end = function ()
{
	return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0);
}
