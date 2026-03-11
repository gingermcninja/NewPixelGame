/// @description Insert description here
// You can write your code in this editor
move_speed = 1;

tile_map = layer_tilemap_get_id("Tiles_Col");

hp = 50;
mp = 10;
hp_total = 50;
mp_total = 10;
damage = 1;
charge = 0;
action_speed = 5;

level = 1;
xp = 0;
xp_required = 100;
battle_xp = 0;

known_spells = [global.all_magic.cure1, global.all_magic.fire1];

function add_xp(_xp_to_add) {
	xp += _xp_to_add;
	if (xp > xp_required) {
		level++;
		xp -= xp_required;
		xp_required *= 1.4;
		
		hp_total += 5;
		hp = hp_total;
		
		mp_total += 5;
		mp = mp_total;
		
		damage += 0.8;
		damage = round(damage);
		audio_play_sound(Woohoo, 0, false);
		create_dialog([
		{
			name: "Congrats",
			msg: $"You leveled up! Your new stats are:\nLVL: {level}\nHP: {hp_total}\nDMG: {damage}"
		}
		]);
	}
}