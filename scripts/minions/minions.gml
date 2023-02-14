// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function minion() constructor{
	
	_speed = 100
	start_frame = 0
	class = "Ranger"
	attack_rate = 500
	target_count = 1
	range = 20
	spr_number = 10
	
	function selected(_selected){
		if _selected == true {
			
			image_blend = c_aqua
			array_push(global.selected_units, self)
		}else{
			image_blend = c_white
			
		}
	}
	
	function move(_x,_y) {
		is_moving = true
		target_x = _x
		target_y = _y
		minion_speed = _speed
		rotation = point_direction(x, y, mouse_x, mouse_y) + 90;
		
		if mp_grid_path(global.grid, path, x, y, target_x, target_y, true){
			path_start(path, 1, path_action_stop, false)
		}
	}
	
	function pickup_item(){
		
	}
}

function brown_minion() : minion() constructor{
	_frame = 1
	_speed = 5
	class = "Bruno"
	attack_rate = 500
	target_count = 2
	range = 50
}