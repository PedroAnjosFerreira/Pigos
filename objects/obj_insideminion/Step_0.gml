current_attack_rate --
		
if current_attack_rate <= 0{
    if collision_circle(x,y,range,obj_enemy,false,true){
        var _list = ds_list_create()
        collision_circle_list(x,y,range,obj_enemy,true,false,_list,true)
        for (var _i = 0; _i < target_count; _i++){
            instance_destroy(ds_list_find_value(_list, _i))

        }
        ds_list_destroy(_list)

    }
    current_attack_rate = attack_rate

}