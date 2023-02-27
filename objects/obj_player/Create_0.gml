
select_mode = false
selection_button_index = 0

group_button_w = 200
group_button_h = 32


text = ""
delete_timer = 0
valid_name = true
displaying_groups = false

selection_toggled = false

clicked = false

minions_in_group = array_create(0)

start_x = 0
start_y = 0
final_x = 0
final_y = 0

	_group_button_x = 16
	_group_button_y = 0
	_input_bar_x = 300
	_input_bar_y = 150

function toggle_gui_to_selecting_selection_type() {
	state = selecting_selection_types
}

function show_groups(){
	_on_click_on_group = function(_i){
		var _selected_group = global.groups[_i]
		for (var _j=0; _j < array_length(_selected_group.minions_in_group); _j++) {
			_selected_group.minions_in_group[_j].selected(true)
		}
		state = create_minion_group_gui
		displaying_groups = false
	}
	state = display_groups
}

function cancel_item_collection(){
	for (var _i = 0; _i < array_length(global.selected_items); _i++;){ 
		var _selectable = global.selected_items[_i];
		_selectable.selected(false)
	}
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _minion = global.selected_units[_i];
		_minion.target_object = noone
		_minion.move(_minion.x, _minion.y)
	}
	global.selected_items = []
	global.selection_type = obj_minion
	state = main_gui
}

function collect_items(){
	move_to_objects(global.selected_units,global.selected_items)
}

function toggle_selection_type_to_resources(){
	global.selection_type = obj_resources
	state = selecting_resources
}
function toggle_selection_type_to_minions(){
	global.selection_type = obj_minion
	state = main_gui
}

function toggle_selection_type_to_items(){
	global.selection_type = obj_items
	state = selecting_items
}
function deselect_minion_and_back_to_main_gui(){
	for (var _i = 0; _i < array_length(global.selected_units);_i ++){
		global.selected_units[_i].selected(false)
	}
	state = main_gui
}

function cancel_resource_mining(){
	
	for (var _i = 0; _i < array_length(global.selected_resources); _i++;){ 
		var _selectable = global.selected_resources[_i];
		_selectable.selected(false)
	}
		
	for (var _i = 0; _i < array_length(global.selected_units); _i++;){ 
		var _minion = global.selected_units[_i]
		_minion.target_object = noone
		_minion.move(_minion.x, _minion.y)
	}
		
	global.selected_resources = []
	global.selection_type = obj_minion
	state = main_gui
	
}

function collect_resources(){
	
	move_to_objects(global.selected_units,global.selected_resources)
	
}

function show_input_bar(){
	
	state = adding_a_name_for_new_group
}
function add_to_existing_group(){
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
#region GUI STATES
function main_gui(){
	
	var _selection_toggle_button = new Button(640-32,360-32,spr_selection_toggle_button,toggle_gui_to_selecting_selection_type)
	var _display_groups_button = new Button(640-16,0,spr_group, show_groups)
	
}

function selecting_selection_types(){
	
	var _select_resources_button = new Button(640/2-16*2,360-16,spr_group,toggle_selection_type_to_resources)
	var _select_items_button = new Button(640/2-16,360-16,spr_group_slot,toggle_selection_type_to_items)
	var _toggle_selection_button = new Button(640/2,360-32,spr_selection_toggle_button,toggle_selection_type_to_minions,16,16,1)

}

function selecting_items(){
	
	var _toggle_selection_button = new Button(640-32,360-32,spr_selection_toggle_button,toggle_selection_type_to_minions,32,32,1)
	var _cancel_button = new Button(148,360-32,spr_cancel_button,cancel_item_collection,32,32,0)
	var _collect_items_button = new Button(180, 360-32, spr_collection_button, collect_items,32,32)
	
}

function selecting_resources(){
	
	var _toggle_selection_button = new Button(148-32,360-32,spr_selection_toggle_button,toggle_selection_type_to_minions,16,16,1)
	var _cancel_resources_mining_button = new Button(148,360-32,spr_cancel_button,cancel_resource_mining,32,32)
	var _collect_resources_button = new Button(148+32,360-32,spr_collection_button,collect_resources,32,32)
	
}
function create_minion_group_gui(){

	var _create_group_button = new Button(16,0,spr_create_group,show_input_bar)
	var _add_to_existing_group = new Button(32,0,spr_add_to_group,add_to_existing_group)
}

function adding_a_name_for_new_group(){
	var _create_group_button = new Button(16,0,spr_create_group,deselect_minion_and_back_to_main_gui)
	var _input_bar_x = 300
	var _input_bar_y = 150
	draw_sprite(spr_name_input,0,_input_bar_x,_input_bar_y)
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

#endregion


_on_click_on_group = function(){}
state = main_gui