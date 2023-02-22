// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function move_to_objects(_minions,_objects){
	var _minion_count = ds_list_size(_minions);
	var _object_count = ds_list_size(_objects);

		if (_minion_count > 0 && _object_count > 0) {
		    for (var i = 0; i < _minion_count; i++) {
		        var _minion = ds_list_find_value(global.labor_minions, i);
		        var _nearest_object = noone;
		        var _nearest_distance = -1;
        
			var _delete_items = ds_list_create();
			for (var j = 0; j < _object_count; j++) {
			    var _object = ds_list_find_value(global.selected_items, j);
			    if (_object != noone && _object != undefined && variable_instance_exists(_object, "assigned_to") && _object.assigned_to == noone) {
			        var _distance = point_distance(_minion.x, _minion.y, _object.x, _object.y);
			        if (_nearest_object == noone || _distance < _nearest_distance) {
			            _nearest_object = _object;
			            _nearest_distance = _distance;
			        }
			    }
			    if (_object != noone && _object != undefined && variable_instance_exists(_object, "assigned_to") && _object.assigned_to != noone) {
			        ds_list_add(_delete_items, j);
			    }
			}
			for (var j = 0; j < ds_list_size(_delete_items); j++) {
			    ds_list_delete(global.selected_items, ds_list_find_value(_delete_items, j));
			}
			ds_list_destroy(_delete_items);

		        if (_nearest_object != noone) {
		            _nearest_object.assigned_to = _minion.id;
					ds_list_delete(global.selected_items,ds_list_find_index(global.selected_items, _nearest_object))
		            _minion.target_object = _nearest_object;
		            _minion.move(_minion.target_object.x, _minion.target_object.y);
		            ds_list_add(global.assigned_minions, _minion);
		        }
		    }
		}
	}
