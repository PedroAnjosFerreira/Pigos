minion_speed = 0
is_moving = false
target_x = 0
target_y = 0
current_attack_rate = attack_rate

path = path_add()
moving = false
image_speed = 0

if instance_exists(obj_structures) {
	with (obj_structures) {
		if other.class != accepted_minion {
			mp_grid_add_instances(global.grid, self, true)
		}
	}
}

function struct_created(_structure) {
	if _structure.accepted_minion != class{
		mp_grid_add_instances(global.grid, _structure, true)
	}
	path_start(path, 1, path_action_stop, false)
}