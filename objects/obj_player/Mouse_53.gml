select_mode = true

start_x = mouse_x
start_y = mouse_y

if instance_number(obj_minion) > 0{
	for (var _i = 0; _i < instance_number(obj_minion); _i++;){ 
		var _selectable = instance_find(obj_minion,_i);
		_selectable.selected(false)
		_selectable.is_moving = false
		global.selected_minions = []
	}
}