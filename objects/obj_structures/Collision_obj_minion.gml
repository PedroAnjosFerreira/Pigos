if minions_inside < minion_limit && placed == true {
	instance_destroy(other)
	minions_inside ++
}