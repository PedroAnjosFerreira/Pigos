rotation += 0.5

for (var _i = 0; _i < sprite_get_number(spr_chest); _i++){
	draw_sprite_ext(sprite, _i, x,y - _i,scale,scale,rotation,image_blend,1)
}

if mouse_entered {
	draw_text(x, y-40, items_inside)
	draw_rectangle(line_x - 16.5, line_y - 16.5, line_x+square_size-16.5, line_y+square_size - 16.5, true);
	
	
	// Define the grid properties
	var _grid_x = x;
	var _grid_y = y + 64;
	var _cell_size = 32;
	var _columns = 4;

	// Loop through the items in the list and draw them in a grid
	for (var _i = 0; _i < ds_list_size(items_inside); _i++) {
	    // Calculate the position of the current cell in the grid
	    var _row = floor(_i / _columns);
	    var _col = _i mod _columns;
	    var _cell_x = _grid_x + _col * _cell_size;
	    var _cell_y = _grid_y + _row * _cell_size;
    
	    // Draw the item at the current cell position
	    var _item = ds_list_find_value(items_inside, _i);
		if items_inside > 0 {
			draw_sprite(_item.sprite_index, _item.image_index, _cell_x, _cell_y);
		}
	}
}

