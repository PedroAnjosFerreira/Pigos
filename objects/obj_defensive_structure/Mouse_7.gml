clicked = true
if first_click {
	first_click = false
}else{
	first_click = true
}
show_debug_message(first_click)
if placed {

    if gui == gui_state.closed && first_click {

       gui = gui_state.open;
       state = function openUpgradeMenu() {

			var _mouse_x = device_mouse_x_to_gui(0);
			var _mouse_y = device_mouse_y_to_gui(0);
			var upgrade_menu_x = 640-64
			var upgrade_menu_y = 360-64
			
            draw_sprite(spr_upgrade_menu, 0, upgrade_menu_x, upgrade_menu_y);
			if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, upgrade_menu_x - 64, upgrade_menu_y - 64, upgrade_menu_x, upgrade_menu_y)){
				show_debug_message("PORRA")
				menu_clicked = true
				show_debug_message("pressed")
			}else if !clicked && !menu_clicked{
				show_debug_message("Penios")
		        gui = gui_state.closed;
				clicked = false
				state = function () {};
			}
        };
    } else {
        state = function () {};
        gui = gui_state.closed;
		clicked = false
    }
}

