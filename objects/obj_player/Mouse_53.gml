select_mode = true

start_x = mouse_x
start_y = mouse_y

<<<<<<< Updated upstream
if array_length(global.selected_units) > 0 && !displaying_groups {
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);

	var _group_button_x = 16
	var _group_button_y = 0
	var _input_bar_x = 300
	var _input_bar_y = 150
	var _add_to_group_button_x = 32
	var _add_to_group_button_y = 0
	
if !point_in_rectangle(_mouse_x, _mouse_y, _group_button_x, _group_button_y, _group_button_x+16, _group_button_y+16) && !point_in_rectangle(_mouse_x, _mouse_y, _input_bar_x, _input_bar_y, _input_bar_x+32, _input_bar_y+16) && !point_in_rectangle(_mouse_x, _mouse_y, _add_to_group_button_x, _add_to_group_button_y, _add_to_group_button_x+32, _add_to_group_button_y+16) && !displaying_groups{
		state = main_gui
		global.all_no_group = true
		for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
			var _selectable = global.selected_units[_i];
			_selectable.selected(false)
		}
=======
if array_length(global.selected_units) > 0{
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _selectable = global.selected_units[_i];
		_selectable.selected(false)
		_selectable.moving = false
>>>>>>> Stashed changes
		global.selected_units = array_create(0)
	}
}

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);


