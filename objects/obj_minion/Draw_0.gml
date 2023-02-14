/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




// Inherit the parent event
event_inherited();
index = 0
for (var _i = start_frame; _i < spr_number; _i++){
	index ++
	draw_sprite_ext(sprite, _i, x,y - index,scale,scale,rotation,image_blend,1)
}
