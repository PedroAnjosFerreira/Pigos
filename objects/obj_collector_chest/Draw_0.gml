draw_self()

if mouse_entered {
	draw_text(x, y-40, items_inside)
	draw_rectangle(line_x - 16.5, line_y - 16.5, line_x+square_size-16.5, line_y+square_size - 16.5, true);
	
	
	// Define the grid properties
	var grid_x = x;
	var grid_y = y + 64;
	var cell_size = 32;
	var columns = 4;

	// Loop through the items in the list and draw them in a grid
	for (var i = 0; i < ds_list_size(items_inside); i++) {
	    // Calculate the position of the current cell in the grid
	    var row = floor(i / columns);
	    var col = i mod columns;
	    var cell_x = grid_x + col * cell_size;
	    var cell_y = grid_y + row * cell_size;
    
	    // Draw the item at the current cell position
	    var item = ds_list_find_value(items_inside, i);
		if items_inside > 0 {
			draw_sprite(item.sprite_index, item.image_index, cell_x, cell_y);
		}
	}
}

