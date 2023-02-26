is_in_group = false
			
inventory = []
target_chest = noone
target_object = noone
target_x = undefined
target_y = undefined

mine_ticks = 0
current_attack_rate = 0

callback = function(){}

grid = mp_grid_create(GRID_START.x, GRID_START.y, GRID_SIZE, GRID_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE)

path = path_add()
image_speed = 0

state = function(){}
draw_gui = function(){}
lastx = x
lasty = y

sprite = spr_pigo_beta_idle_0
rotation = 0
scale = 2

path_start(path, 1, path_action_stop, false)

#region Minion States
	function walkingState(){
		
		mp_grid_clear_all(grid)
	
		if instance_exists(obj_minion){
			with obj_minion {
				if self.id != other.id{
					mp_grid_add_instances(other.grid,self,true)
					mp_grid_add_instances(self.grid,other,true)
				}
			}
		}
		
		if instance_exists(obj_collidable){
			for (var _i = 0; _i < instance_number(obj_collidable); _i++) {
			    var _collidable = instance_find(obj_collidable, _i);
				if _collidable.id != target_object {
					mp_grid_add_instances(grid,_collidable,true)
				}else{
					
					if mp_grid_path(grid, path, x, y, target_x, target_y, true){
						path_start(path, 1, path_action_stop, false)
					}
				}
			}
		}
		
		rotation = point_direction(lastx, lasty, x,y)+90;
		lastx = x
		lasty = y
}
#endregion

#region Minion Functions

	function selected(_selected, _all_no_group = true){
	//	__selected = _selected
		if _selected == true {
			array_push(global.selected_units,self)
			image_blend = c_aqua
		}else{
			image_blend = c_white

		}
	}

	//Called to make a minion move to whatever you want
	function move(_x,_y, _callback_function = function(){}, _target_object = noone){
	
		walkingState()
		state = walkingState
	
		target_x = _x
		target_y = _y
		target_object = _target_object
		
		if mp_grid_path(grid, path, x, y, target_x, target_y, true){
			path_start(path, 1, path_action_stop, false)
		}
	
		// Callback is a function that is executed when the minion finishes it's path
		callback = _callback_function

	}


	//Called when a minion pick an item to make him store it in a chest
	function pegou_item(_item){
		array_push(inventory,_item)
		
		if inventory_slots <= array_length(inventory) || array_length(global.selected_items) == 0{
			show_debug_message("OLA")
			self.target_chest = instance_nearest(x,y,obj_collector_chest)
			move(self.target_chest.line_x, self.target_chest.line_y, function(){
			
				//callback
				for(var _i = 0; _i < array_length(inventory);_i++){
					self.target_chest.add(inventory[_i])
					instance_destroy(inventory[_i])
				}
				inventory = []
			
				if array_length(global.selected_items) > 0 {
					move_to_objects([self],global.selected_items)
				}
			
			})
		
		}else {
			move_to_objects([self],global.selected_items)
		}
	}

	//Called when a minion mines a resource, to make him go mine another if there other selected
	function mined_resource(){
	
		if array_length(global.selected_resources) > 0 {
			move_to_objects([self],global.selected_resources)
		}
	
	}

#endregion
