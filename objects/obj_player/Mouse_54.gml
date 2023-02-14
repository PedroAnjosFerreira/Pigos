if global.selection_type == obj_minion {
	var _selected_minion_count = array_length(global.selected_units)

	for (var _i = 0; _i < _selected_minion_count; _i++){
		global.selected_units[_i].move(mouse_x, mouse_y)
	}
}