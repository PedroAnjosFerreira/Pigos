
for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _selectable = global.selected_units[_i];
		_selectable.selected(false)
		_selectable.moving = false
		global.selected_units = array_create(0)
}

if global.selection_type == obj_item {
	global.selection_type = obj_minion
	global.GUI_state = obj_player.GUIState.main
}else{
	global.selection_type = obj_item
	global.GUI_state = obj_player.GUIState.selecting_items
}