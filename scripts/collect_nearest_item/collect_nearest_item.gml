// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function collect_nearest_item(_minion) {
    var _object_count = ds_list_size(global.selected_items);
	
    var _nearest_object = noone;
    var _nearest_distance = -1;

        for (var _j = 0; _j < _object_count; _j++) {
            var _object = ds_list_find_value(global.selected_items, _j);
            if (_object.assigned_to == noone) {
                var _distance = point_distance(_minion.x, _minion.y, _object.x, _object.y);
                if (_nearest_object == noone || _distance < _nearest_distance) {
                    _nearest_object = _object;
                    _nearest_distance = _distance;
                }
            }
        }

        if (_nearest_object != noone) {
            _nearest_object.assigned_to = _minion.id;
            _minion.target_object = _nearest_object;
            _minion.move(_minion.target_object.x, _minion.target_object.y);
            ds_list_add(global.assigned_minions, _minion);
            _minion.callback = function(){}
        }
    }
