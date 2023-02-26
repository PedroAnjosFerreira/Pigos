clicked = true
first_click = !first_click
show_debug_message(first_click)
if placed {

    if gui == GUI_STATE.CLOSED && first_click {

       gui = GUI_STATE.OPEN;
       state = function open_upgrade_menu() {

			var _mouse_x = device_mouse_x_to_gui(0);
			var _mouse_y = device_mouse_y_to_gui(0);
			var upgrade_menu_x = 640-64
			var upgrade_menu_y = 360-64
			
            draw_sprite(spr_upgrade_menu, 0, upgrade_menu_x, upgrade_menu_y);
			if mouse_check_button_pressed(mb_left) && (point_in_rectangle(_mouse_x, _mouse_y, upgrade_menu_x - 64, upgrade_menu_y - 64, upgrade_menu_x, upgrade_menu_y)){
				menu_clicked = true
			}else if !clicked && !menu_clicked{
				first_click = false
		        gui = GUI_STATE.CLOSED;
				clicked = false
				state = function () {};
			}
        };
    } else {
        state = function () {};
        gui = GUI_STATE.CLOSED;
		clicked = false
    }
}

