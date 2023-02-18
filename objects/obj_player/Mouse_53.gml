select_mode = true

start_x = mouse_x
start_y = mouse_y




if array_length(global.selected_units) > 0{
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _selectable = global.selected_units[_i];
		_selectable.selected(false)
		_selectable.moving = false
		global.selected_units = array_create(0)
	}
}

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if (point_in_rectangle(_mouse_x, _mouse_y, 60, 10, 60 + 16, 10 + 16)) {
	if global.selection_type = obj_minion {
		global.selection_type = obj_item
		selection_button_index = 1
	}else {
		global.selection_type = obj_minion
		selection_button_index = 0
	}
}
