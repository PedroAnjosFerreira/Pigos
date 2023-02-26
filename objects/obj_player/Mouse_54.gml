if global.selection_type == obj_minion {
	var _selected_minion_count = array_length(global.selected_units)
	
	if !place_meeting(x,y,obj_minion_structures){
		for (var _i = 0; _i < _selected_minion_count; _i++){

			global.selected_units[_i].move(mouse_x, mouse_y)
		}
	}else {
		var _object = instance_place(mouse_x, mouse_y,obj_minion_structures)
		var _object_id = _object.id
		for (var _i = 0; _i < _selected_minion_count; _i++){
			var _class = global.selected_units[_i].class
			if _class == _object_id.accepted_minion && _object_id.minions_inside  < _object_id.minion_limit {
				global.selected_units[_i].move(mouse_x, mouse_y,,_object_id)
			}
		}
	}

}

