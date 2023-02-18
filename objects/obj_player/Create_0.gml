select_mode = false
selection_button_index = 0

enum GUIState {
    main,
    selecting_items,

}

global.GUI_state = GUIState.main


global.selected_units = array_create(0)
global.selection_type = obj_minion
global.labor_minions = ds_list_create();
global.selected_items = ds_list_create();
global.assigned_minions = ds_list_create()

index = 60
start_x = 0
start_y = 0
final_x = 0
final_y = 0