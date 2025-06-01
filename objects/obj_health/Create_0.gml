/// @description Insert description here
// You can write your code in this editor
function activate(player) {
	player.hp += 10;
	if player.hp > player.hp_total {
		player.hp = player.hp_total;	
	}
	instance_destroy(self);
}