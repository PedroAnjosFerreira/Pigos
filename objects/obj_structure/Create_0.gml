placed = false

minions_inside = 0
minion_limit = 4
range = 100

grid_size = 64

object_set_sprite(0, spr_wood_tower)

function inside_minion(_range, _attack_rate, _target_count, _current_attack_rate) constructor{
	visible = false
	current_attack_rate = _current_attack_rate
	range = _range
	attack_rate = _attack_rate
	target_count = _target_count
}