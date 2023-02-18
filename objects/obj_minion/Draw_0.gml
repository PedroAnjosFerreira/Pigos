/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




// Inherit the parent event
event_inherited();

	index = 0
	for (var _i = 0; _i < sprite_get_number(sprite); _i++){
		index ++
		draw_sprite_ext(sprite, _i, x,y - index *scale,scale,scale,rotation,image_blend,1)
	}
	
	
draw_text(x, y - 120, inventory)

