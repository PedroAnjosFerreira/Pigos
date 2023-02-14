select_mode = false

var _list = ds_list_create()
var _count = collision_rectangle_list(start_x, start_y, final_x, final_y, global.selection_type, false, false, _list, false)
if _count > 0 {
	for (var _i = 0; _i < _count; _i++){
		_list[|_i].selected(true)
	}
}


ds_list_destroy(_list)