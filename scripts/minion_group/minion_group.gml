// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function MinionGroup(_minions, _name) constructor{
	group_name = _name
	minions_in_group = _minions
	minion_count = 0
}

function create_minion_group_gui(){
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _create_group_button_x = 16
	var _create_group_button_y = 0
	var _add_to_group_button_x = 32
	var _add_to_group_button_y = 0

	draw_sprite(spr_group,0,_create_group_button_x,_create_group_button_y)
	draw_sprite(spr_group,0,_add_to_group_button_x,_add_to_group_button_y)
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, _add_to_group_button_x, _add_to_group_button_y, _add_to_group_button_x+32, _add_to_group_button_y+16)) {
			
		_on_click_on_group = function(_i){

			var _new_minion_group = []
			var _selected_group = global.groups[_i]
			var _name = _selected_group.group_name
			if global.all_no_group {
				for (var _j=0; _j < array_length(_selected_group.minions_in_group); _j++) {
				   array_push(_new_minion_group,_selected_group.minions_in_group[_j])
				}
				for (var _k=0; _k < array_length(global.selected_units);_k++){
					array_push(_new_minion_group,global.selected_units[_k])
				}
				array_delete(global.groups,_i,1)
				var _new_group = new MinionGroup(_new_minion_group,_name)
				array_push(global.groups,_new_group)
			}else {
				show_debug_message("Already in group")
			}
			displaying_groups = false
			state = create_minion_group_gui
		}
		
		state = display_groups
	}
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, _create_group_button_x, _create_group_button_y, _create_group_button_x+16, _create_group_button_y+16)) {
		state = function (){
			var _mouse_x = device_mouse_x_to_gui(0);
			var _mouse_y = device_mouse_y_to_gui(0);
	
			var _create_group_button_x = 16
			var _create_group_button_y = 0
						
			var _input_bar_x = 300
			var _input_bar_y = 150
							
			draw_sprite(spr_group,0,_create_group_button_x,_create_group_button_y)
			draw_sprite(spr_name_input,0,_input_bar_x,_input_bar_y)
														
			if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, _create_group_button_x, _create_group_button_y, _create_group_button_x+16, _create_group_button_y+16)) {
				for (var _i = 0; _i < array_length(global.selected_units);_i ++){
						global.selected_units[_i].selected(false)
				}
				state = main_gui
				}			
				if keyboard_check(vk_anykey) && string_length(text) < 20{
					text = text + string(keyboard_string)
					keyboard_string = ""
				}
							
				if keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && delete_timer == 2 {
					text = string_delete(text,string_length(text),1)
					delete_timer = 0
					keyboard_string = ""
				}
							
				if keyboard_check_pressed(vk_backspace){
					text = string_delete(text,string_length(text),1)
					keyboard_string = ""
					delete_timer = -4
				}
							
				if delete_timer != 2 {
					delete_timer ++
				}
							
				draw_text(_input_bar_x,_input_bar_y,text)
							
				if keyboard_check_pressed(vk_enter) {
					var _valid_name = true
				
					for (var _i = 0; _i < array_length(global.groups);_i++){
						if global.groups[_i].group_name == text {
							_valid_name = false
						}
					}
				
					if global.all_no_group && _valid_name {
						var _group = new MinionGroup(global.selected_units,text)
						array_push(global.groups, _group)
						for (var _i = 0; _i < array_length(global.selected_units); _i ++){
							global.selected_units[_i].is_in_group = true
							global.selected_units[_i].group = text
							global.selected_units[_i].selected(false)
						}
					
						state = main_gui
						text = ""
					}else {
						show_debug_message("Already in group")
						}
					}
			}
		}
}

function display_groups(){
	displaying_groups = true
	for (var _i = 0; _i < array_length(global.groups);_i++){
		
		var _button_x = 400
		var _button_y = 32*_i
	
		draw_sprite_stretched(spr_button,0,_button_x,_button_y, group_button_w,group_button_h)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(_button_x+(group_button_w*0.5),_button_y+(group_button_h*0.5),global.groups[_i].group_name)
	
		if mouse_check_button_pressed(mb_left) && point_in_rectangle(D_MOUSE_X, D_MOUSE_Y, _button_x, _button_y, _button_x+group_button_w, _button_y+group_button_h){
			_on_click_on_group(_i)
		}	
	}
}
