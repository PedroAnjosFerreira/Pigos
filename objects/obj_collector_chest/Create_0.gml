mouse_entered = false
line_position = noone
direction = 270
items_inside = ds_list_create();

square_size = 32;
x_offset = lengthdir_x(square_size, direction);
y_offset = lengthdir_y(square_size, direction);
line_x = x + x_offset;
line_y = y + y_offset;
	


function add(_item){
	ds_list_add(items_inside,_item)
}