/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_battle_switcher)) exit;

instance_create_depth(0, 0, 0, obj_carry_data, {
	level: level,
	xp: xp,
	xp_required: xp_required,
	damage: damage,
	hp_total: hp_total,
	hp: hp
});