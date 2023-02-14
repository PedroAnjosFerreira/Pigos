if placed == false{
	x = (floor(mouse_x / grid_size) * grid_size) - grid_size
	y = (floor(mouse_y / grid_size) * grid_size) - grid_size
	
	if mouse_check_button_pressed(mb_left){
		placed = true

	}
}