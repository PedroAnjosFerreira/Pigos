for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _selectable = global.selected_units[_i];
		_selectable.selected(false)
		_selectable.moving = false
		global.selected_units = array_create(0)
}

if global.selection_type == obj_item {
	global.selection_type = obj_minion
	
}else{
	global.selection_type = obj_item
	instance_create_layer(x,y,"GUI", obj_GUI_Button, new button() )
}