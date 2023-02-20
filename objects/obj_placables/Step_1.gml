if placed == false{
	x = (floor(mouse_x / GRID_CELL_SIZE) * GRID_CELL_SIZE) - GRID_CELL_SIZE
	y = (floor(mouse_y / GRID_CELL_SIZE) * GRID_CELL_SIZE) - GRID_CELL_SIZE
	
	if mouse_check_button_pressed(mb_left){
		placed = true
		_x = x
		_y = y
	}
}