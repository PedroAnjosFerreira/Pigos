// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function pressed() {
	show_debug_message("Pedro")
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
			var _selectable = global.selected_units[_i];
			_selectable.selected(false)
			_selectable.moving = false
			global.selected_units = array_create(0)
	}

	if global.selection_type == obj_resource {
		global.selection_type = obj_minion
	
	}else{
		global.selection_type = obj_resource
	}
}