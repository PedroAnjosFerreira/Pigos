draw_circle(x,y,range,1)
draw_set_alpha(1)
draw_text(x, y-60, rotation)
if __selected {
	draw_set_alpha(0.3)
	mp_grid_draw(grid)
}
index = 0
for (var _i = 0; _i < sprite_get_number(sprite); _i++){
	index ++
	draw_sprite_ext(sprite, _i, x,y - index*scale,scale,scale,rotation,image_blend,1)
}
	
	
draw_text(x, y - 120, inventory)
