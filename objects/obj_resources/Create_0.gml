assigned_to = noone
picked = false
mine_ticks_needed = 2

image_speed = 0
function selected(_true){
	if _true{
		array_push(global.selected_resources, self)
		image_blend = c_yellow
	}else{
		image_blend = c_white
	}
}

function mined(){
	assigned_to.mined_resource()
	instance_destroy()
	instance_create_layer(x,y,"Items",obj_items)
}

function assigned(_minion){
    var _index = -1;
    for (var _i = 0; _i < array_length(global.selected_resources); _i++) {
        if (global.selected_resources[_i] == self) {
            _index = _i;
            break;
        }
    }
    if (_index != -1) {
        array_delete(global.selected_resources, _index,1);
    }
    assigned_to = _minion.id;
}

square_size = 16;
x_offset = lengthdir_x(square_size, direction);
y_offset = lengthdir_y(square_size, direction);
minion_interaction_x = x + x_offset;
minion_interaction_y = y + y_offset;