// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function animation_player (_sprite_list, _state, _scale, _loop) constructor {
	sprites = _sprite_list[_state]
	frame = 0
	scale = _scale
	loop = _loop
	
	function _draw(_x,_y,_rotation){
		index = 0
		for (var _i = 0; _i < sprite_get_number(sprites[frame]); _i++){
			index ++
			draw_sprite_ext(sprites[frame], _i, _x, _y - index * scale, scale, scale, _rotation, c_white, 1)
		}
	}
}

