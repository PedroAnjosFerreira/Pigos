current_attack_rate --
		
if current_attack_rate <= 0{

	for (var _i = 0; _i < target_count; _i++){

		var _enemy = instance_nearest(x, y, obj_enemy)
		if distance_to_object(_enemy) <= range{
			instance_destroy(_enemy)
		}
		current_attack_rate = attack_rate
	}
	
}