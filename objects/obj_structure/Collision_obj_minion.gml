
if minions_inside < minion_limit && placed == true {
	instance_create_layer(x,y,"Instances",obj_insideminion, new inside_minion(range,other.attack_rate,other.target_count,other.current_attack_rate))
	instance_destroy(other)
	minions_inside ++
}