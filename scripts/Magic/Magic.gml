// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
all_magic = {
	fire1: {
		identifier: "fire1",
		cost: 2,
		effect: 5,
		sound: zap,
		title: "Fire",
		target: "enemy",
		animation: "fire1"
	},
	ice1: {
		identifier: "ice1",
		cost: 2,
		effect: 5,
		sound: zap,
		title: "ice",
		target: "enemy",
		animation: "ice1"
	},
	lightning1: {
		identifier: "lightning1",
		cost: 2,
		effect: 5,
		sound: zap,
		title: "Lightning",
		target: "enemy",
		animation: "lightning1"
	},
	cure1: {
		identifier: "cure1",
		cost: 3,
		effect: 5,
		sound: zap,
		title: "Cure",
		target: "player",
		animation: "cure1"
	}
}

function findSpellByIdentifier(_identifier) {
	return all_magic[$ _identifier]
}