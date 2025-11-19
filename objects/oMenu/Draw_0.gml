/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_box, 0, x-margin, y-margin, widthFull, heightFull);

draw_set_colour(c_white);
draw_set_font(Font1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var desc = !(description == -1);
for (i = 0; i < (optionsCount + desc); i++) {
	draw_set_colour(c_white);
	if (i == 0) && (desc) {
		draw_text(x, y, description);
	}
	else {
		var _str = options[i - desc][0]
		if (hover == 1 - desc) {
			draw_set_colour(c_aqua);
			_str = hoverMarker + _str;
		}
		draw_text(x, y + (i * heightLine), _str);
	}
}