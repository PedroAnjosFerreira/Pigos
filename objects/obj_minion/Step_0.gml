current_attack_rate -= 1

if x != target_x && y != target_y {
	mp_linear_step(target_x, target_y, minion_speed*DELTA, 0)
}

if current_attack_rate <= 0{
	if collision_circle(x,y,range,obj_enemy,false,true){
		for (var _i = 0; _i < target_count; _i++){
			var _enemy = instance_nearest(x, y, obj_enemy)
			instance_destroy(_enemy)
		}
	}
	current_attack_rate = attack_rate
}