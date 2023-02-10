var _selected_minion_count = array_length(global.selected_minions)

for (var _i = 0; _i < _selected_minion_count; _i++){
	global.selected_minions[_i].move(mouse_x, mouse_y)
}