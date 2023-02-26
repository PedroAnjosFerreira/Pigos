item_sprite = spr_item


assigned_to = noone
picked = false
minion_interaction_x = x
minion_interaction_y = y
image_speed = 0
function selected(_true){
	if _true{
		array_push(global.selected_items, self)
		image_blend = c_yellow
	}else{
		assigned_to = noone
		image_blend = c_white
	}
}

function assigned(_minion){
	
    var _index = -1;
    for (var _i = 0; _i < array_length(global.selected_items); _i++) {
        if (global.selected_items[_i] == self) {
            _index = _i;
            break;
        }
    }
	
    if (_index != -1) {
        array_delete(global.selected_items, _index,1);
    }
	
    assigned_to = _minion.id;
}

