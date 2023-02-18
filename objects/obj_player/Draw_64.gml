var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if global.GUI_state == GUIState.main {
	
	selection_button_index = 0
	
	draw_sprite(spr_selection_button,selection_button_index,640 - 32,360 - 32)
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 640 - 32, 360 - 32, 640, 360)) {
		if global.selection_type == obj_item {
			global.selection_type = obj_minion
			global.GUI_state = GUIState.main
		}else{
			global.selection_type = obj_item
			global.GUI_state = GUIState.selecting_items
		}
	}
}else if global.GUI_state == GUIState.selecting_items{
	selection_button_index = 1
	//Toggle Selection
	draw_sprite(spr_selection_button,selection_button_index,640 - 32,360 -32)
	
	//Botão de Cancelar
	draw_sprite(spr_selection_button,3,148,360 - 32)
	
	//Botão de coletar
	draw_sprite(spr_selection_button,4,180,360 - 32)
	
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 640 - 32, 360 - 32, 640, 360)) {
		if global.selection_type == obj_item {
			global.selection_type = obj_minion
			for (var _i = 0; _i < ds_list_size(global.selected_items); _i++;){ 
				var _selectable = ds_list_find_value(global.selected_items, _i);
				_selectable.selected(false)
			}
		ds_list_clear(global.selected_items)
			global.GUI_state = GUIState.main
		}else{
			global.selection_type = obj_item
			global.GUI_state = GUIState.selecting_items
		}
	}
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 148, 360 - 32, 148 + 32, 360)) {
		for (var _i = 0; _i < ds_list_size(global.selected_items); _i++;){ 
			var _selectable = ds_list_find_value(global.selected_items,_i);
			_selectable.assigned_to = noone
			_selectable.selected(false)
		}
		for (var _i = 0; _i < ds_list_size(global.labor_minions); _i++;){ 
			var _selectable = ds_list_find_value(global.labor_minions,_i);
			_selectable.target_object = noone
			_selectable.move(_selectable.x, _selectable.y)
		}
		ds_list_clear(global.selected_items)
		global.GUI_state = GUIState.main
		}
	}	
	//Collect Button
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 180, 360 - 32, 180 + 32, 360)) {
	var _minion_count = ds_list_size(global.labor_minions);
	var _object_count = ds_list_size(global.selected_items);

	if (_minion_count > 0 && _object_count > 0) {
	    for (var i = 0; i < _minion_count; i++) {
	        var _minion = ds_list_find_value(global.labor_minions, i);
	        var _nearest_object = noone;
	        var _nearest_distance = -1;
        
	        for (var j = 0; j < _object_count; j++) {
	            var _object = ds_list_find_value(global.selected_items, j);
            
	            if (_object.assigned_to == noone) {
	                var _distance = point_distance(_minion.x, _minion.y, _object.x, _object.y);
                
	                if (_nearest_object == noone || _distance < _nearest_distance) {
	                    _nearest_object = _object;
	                    _nearest_distance = _distance;
	                }
	            }
	        }

	        if (_nearest_object != noone) {
	            _nearest_object.assigned_to = _minion;
	            _minion.target_object = _nearest_object;
	            _minion.move(_minion.target_object.x, _minion.target_object.y);
	            ds_list_add(global.assigned_minions, _minion);
	        }
	    }
	}
}