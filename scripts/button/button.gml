// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Button(_x,_y,_sprite,_on_click,_width = 16,_height = 16,_index = 0) constructor{
	draw_sprite_stretched(_sprite,_index,_x,_y,_width,_height)
	if mouse_check_button_pressed(mb_left) && point_in_rectangle(D_MOUSE_X, D_MOUSE_Y, _x, _y, _x+_width, _y+_height){
		_on_click()
	}
}

