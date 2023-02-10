function minion() constructor{
	
	_speed = 10
	_frame = 0
	_id = 1
	attack_rate = 500
	target_count = 1
	range = 20
	
	function selected(_selected){
		if _selected == true {
			image_blend = c_aqua
			array_push(global.selected_minions, self)
		}else{
			image_blend = c_white
			
		}
	}
	
	function move(_x,_y) {
		is_moving = true
		target_x = _x
		target_y = _y
		minion_speed = _speed
	}
}

function brown_minion() : minion() constructor{
	_frame = 1
	_speed = 5
	_id = 2
	attack_rate = 500
	target_count = 2
	range = 50
}