// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function minion() constructor{

	_speed = 100
	start_frame = 0
	class = "Ranger"
	attack_rate = 500
	target_count = 1
	range = 20
	spr_number = 10
	target_object = noone
	callback = function(){}
	inventory_slots = 4
	inventory = array_create(0)
	target_chest = noone
	assigned = false
	__selected = false
	
	is_in_group = false
	delete_timer = 0
	text = ""
	cont = 0
	group = ""
	
	collection_rate = 250
	
	function selected(_selected, _all_no_group = true){
		__selected = _selected
		if _selected == true {
			array_push(global.selected_units,self)
			image_blend = c_aqua
		}else{
			image_blend = c_white

		}
	}
	
	function move(_x,_y, _callback_function = function(){}, _target_object = noone){
		walkingState()
		state = walkingState
		is_moving = true
		target_x = _x
		target_y = _y
		minion_speed = _speed
		target_object = _target_object
		
		
		if mp_grid_path(grid, path, x, y, target_x, target_y, true){
			path_start(path, 1, path_action_stop, false)
		}
		callback = _callback_function

	}
	
	function picked_item(_item){
		
		array_push(inventory,_item)
		if inventory_slots <= array_length(inventory) || ds_list_size(global.selected_items) <= 0{
			target_chest = instance_nearest(x,y,obj_collector_chest)
			move(target_chest.line_x, target_chest.line_y, function(){
		
				for(var _i = 0; _i < array_length(inventory);_i++){
					target_chest.add(inventory[_i])
					instance_destroy(inventory[_i])
				}
				inventory = array_create(0)
			
				if ds_list_size(global.selected_items) > 0 {
					collect_nearest_item(self)
				}
			
			})
		}else {
			collect_nearest_item(self)
		}
	}
	
}

function brown_minion() : minion() constructor{
	_frame = 1
	_speed = 5
	class = "Bruno"
	attack_rate = 500
	target_count = 2
	range = 50
}