select_mode = true

start_x = mouse_x
start_y = mouse_y

if array_length(global.selected_units) > 0 && global.selection_type == obj_minion{
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _selectable = global.selected_units[_i];
		_selectable.selected(false)
		_selectable.moving = false
		global.selected_units = array_create(0)
	}
}