/// @description Insert description here
// You can write your code in this editor
move_speed = 1;

tile_map = layer_tilemap_get_id("Tiles_Col");

hp = 10;
hp_total = 10;
damage = 1;
charge = 0;

level = 1;
xp = 0;
xp_required = 100;

function add_xp(_xp_to_add) {
	xp += _xp_to_add;
	if (xp > xp_required) {
		level++;
		xp -= xp_required;
		xp_required *= 1.4;
		
		hp_total += 5;
		hp = hp_total;
		damage += 0.8;
	}
}