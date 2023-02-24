
minion_speed = 0
is_moving = false
target_x = 0
target_y = 0
current_attack_rate = attack_rate


grid = mp_grid_create(GRID_START.x, GRID_START.y, GRID_SIZE, GRID_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE)
path = path_add()
moving = false
image_speed = 0



state = function(){}
draw_gui = function(){}
lastx = x
lasty = y


sprite = spr_pigo_beta_idle_0
rotation = 0
scale = 2


path_start(path, 1, path_action_stop, false)

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
