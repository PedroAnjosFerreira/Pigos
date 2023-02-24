select_mode = false
selection_button_index = 0

group_button_w = 200
group_button_h = 32


text = ""
delete_timer = 0
valid_name = true
displaying_groups = false

enum GUIState {
    main,
    selecting_items,

}

global.GUI_state = GUIState.main


<<<<<<< Updated upstream

=======
global.selected_units = []
>>>>>>> Stashed changes
global.selection_type = obj_minion
global.labor_minions = ds_list_create();
global.selected_items = ds_list_create();
global.assigned_minions = ds_list_create()
global.groups = array_create(0)
global.all_no_group = true
minions_in_group = array_create(0)
index = 60
start_x = 0
start_y = 0
final_x = 0
final_y = 0

	_group_button_x = 16
	_group_button_y = 0
	_input_bar_x = 300
	_input_bar_y = 150

function main_gui(){
//	_on_click_on_group = function(){}
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _group_button_x = 640-16
	var _group_button_y = 0
	
	var _selection_button_x = 640-32
	var _selection_button_y = 360-32
	var _selection_button_index = 0
	
	draw_sprite(spr_selection_button,_selection_button_index,_selection_button_x,_selection_button_y)
	draw_sprite(spr_group,0,_group_button_x,_group_button_y)
	
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, _selection_button_x, _selection_button_y, _selection_button_x+32, _selection_button_x+32)) {
		state = selecting_selection_types
	}
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, _group_button_x, _group_button_y, _group_button_x+16, _group_button_y+16)) {
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
}

function selecting_items(){
	
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _selection_button_index = 1
	//Toggle Selection
	draw_sprite(spr_selection_button,_selection_button_index,640 - 32,360 -32)
	
	//Botão de Cancelar
	draw_sprite(spr_selection_button,3,148,360 - 32)
	
	//Botão de coletar
	draw_sprite(spr_selection_button,4,180,360 - 32)
	
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 640 - 32, 360 - 32, 640, 360)) {
			global.selection_type = obj_minion
			state = main_gui
			for (var _i = 0; _i < ds_list_size(global.selected_items);_i++){
				var _item = ds_list_find_value(global.selected_items,_i)
				_item.selected(false)
			}
	}
	
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 148, 360 - 32, 148 + 32, 360)) {
		for (var _i = 0; _i < ds_list_size(global.selected_items); _i++;){ 
			var _selectable = ds_list_find_value(global.selected_items,_i);
			_selectable.selected(false)
		}
		for (var _i = 0; _i < ds_list_size(global.labor_minions); _i++;){ 
			var _minion = ds_list_find_value(global.labor_minions,_i);
			_minion.target_object = noone
			_minion.move(_minion.x, _minion.y)
		}
		ds_list_clear(global.selected_items)
		global.selection_type = obj_minion
		state = main_gui
	}	
	//Collect Button
	if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, 180, 360 - 32, 180 + 32, 360)) {
		move_to_objects(global.labor_minions,global.selected_items)
	}
}

function selecting_selection_types(){
	var _select_resources_button_x = 640/2-16*2
	var _select_resources_button_y = 360-16
	
	var _select_items_button_x = 640/2-16
	var _select_items_button_y = 360-16
	
	draw_sprite(spr_group,0,_select_resources_button_x,_select_resources_button_y)
	draw_sprite(spr_group,0,_select_items_button_x,_select_items_button_y)
	
	if mouse_check_button_pressed(mb_left) && point_in_rectangle(D_MOUSE_X, D_MOUSE_Y, _select_resources_button_x, _select_resources_button_y, _select_items_button_x+16,_select_items_button_y+16){
		global.selection_type = obj_items
		state = selecting_items
	}
	if mouse_check_button_pressed(mb_left) && point_in_rectangle(D_MOUSE_X, D_MOUSE_Y, _select_items_button_x, _select_items_button_y, _select_items_button_x+16, _select_items_button_y+16){
		global.selected_items = obj_resources
		state = selecting_resources
	}
}

_on_click_on_group = function(){}
state = main_gui