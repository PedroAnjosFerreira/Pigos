if minions_inside < minion_limit && placed == true && other.class == accepted_minion {
	instance_create_layer(x,y,"Minions",obj_insideminion, new InsideMinion(range,other.attack_rate,other.target_count,other.current_attack_rate, MINION_MODES.DEFENSIVE))
	instance_destroy(other)
	minions_inside ++
}