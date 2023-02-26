// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function move_to_objects(_minions,_objects){
	var _minion_count = array_length(_minions);
	
		if (_minion_count > 0) {
		    for (var _i = 0; _i < _minion_count; _i++) {
				
		        var _minion = _minions[_i];
		        var _nearest_object = noone;
		        var _nearest_distance = -1;
				var _object_count = array_length(_objects);
				for (var _j = 0; _j < _object_count; _j++) {
				    var _object = _objects[_j];
				    if (_object != noone && _object != undefined && variable_instance_exists(_object, "assigned_to") && _object.assigned_to == noone) {
				        var _distance = point_distance(_minion.x, _minion.y, _object.x, _object.y);
				        if (_nearest_object == noone || _distance < _nearest_distance) {
				            _nearest_object = _object;
				            _nearest_distance = _distance;
				        }
				    }
				    if (_object != noone && _object != undefined && variable_instance_exists(_object, "assigned_to") && _object.assigned_to != noone) {
				        array_delete(_objects, _j,1);
				    }
				}

			        if (_nearest_object != noone) {
			            _nearest_object.assigned(_minion)
						if _nearest_object == obj_items {
							_minion.move(_nearest_object.minion_interaction_x, _nearest_object.minion_interaction_y,function(){} ,_nearest_object);
						}else {
							_minion.move(_nearest_object.minion_interaction_x, _nearest_object.minion_interaction_y, mine_resource,_nearest_object);
						}
		            
						array_push(global.assigned_minions, _minion);    
			        }
			}
		}
	}
