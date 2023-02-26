
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
	for (var _i = 0; _i < array_length(global.labor_minions); _i++;){ 
		var _minion = global.labor_minions[_i];
		_minion.target_object = noone
		_minion.move(_minion.x, _minion.y)
	}
	global.selected_items = []
	global.selection_type = obj_minion
	state = main_gui
}

function collect_items(){
	move_to_objects(global.labor_minions,global.selected_items)
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

function cancel_resource_mining(){
	
	for (var _i = 0; _i < array_length(global.selected_resources); _i++;){ 
		var _selectable = global.selected_resources[_i];
		_selectable.selected(false)
	}
		
	for (var _i = 0; _i < array_length(global.labor_minions); _i++;){ 
		var _minion = global.labor_minions[_i]
		_minion.target_object = noone
		_minion.move(_minion.x, _minion.y)
	}
		
	global.selected_resources = []
	global.selection_type = obj_minion
	state = main_gui
	
}

function collect_resources(){
	
	move_to_objects(global.labor_minions,global.selected_resources)
	
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
	
#endregion


_on_click_on_group = function(){}
state = main_gui