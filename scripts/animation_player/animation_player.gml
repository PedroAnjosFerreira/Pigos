
function AnimationPlayer (_sprite_list, _state, _scale, _anim_param) constructor {
	sprite_list = _sprite_list
	state_sprites = _sprite_list[_state]
	cur_state = _state
	frame = 0
	scale = _scale
	anim_param = _anim_param
	delay = anim_param[_state].delay
	loop = anim_param[_state].loop
	alarm[0] = delay
	
	// Draws 1 frame
	// Must be placed in the "Draw" event
	static draw = function(_x,_y,_rotation){
		// Updating values
		state_sprites = sprite_list[cur_state]
		delay = anim_param[cur_state].delay
		loop = anim_param[cur_state].loop
		
		// Drawing frame
		for (var _i = 0; _i < sprite_get_number(state_sprites[frame]); _i++){
			draw_sprite_ext(state_sprites[frame], _i, _x, _y - _i * scale, scale, scale, _rotation, c_white, 1)
		}
	}
	
	// Steps 1 frame of the animation
	// Must be placed in "Step" event
	static step = function(){
		alarm[0]--
		
		if (alarm[0] > 0) return;
		
		var _max = array_length(state_sprites) - 1
		if(frame + 1 <= _max){
			frame++
		}else{
			if(loop == false){
				cur_state = 0
			}
			frame = 0
		}
		
		alarm[0] = delay
	}
	

}
