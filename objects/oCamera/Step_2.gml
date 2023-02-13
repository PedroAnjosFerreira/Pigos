camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight)


camera_set_view_pos(view_camera[0],camera_x,camera_y)

var _dead_zone_start_x = camera_x + (global.cameraWidth - dead_zone_size_x) / 11;
var _dead_zone_end_x = camera_x + (global.cameraWidth + dead_zone_size_x)/1.1;

var _dead_zone_start_y = camera_y + (global.cameraHeight - dead_zone_size_y) / 10;
var _dead_zone_end_y = camera_y + (global.cameraHeight + dead_zone_size_y)/1.2;


//Dragging:
if mouse_check_button(mb_middle){
	var move_x = device_mouse_x_to_gui(0) - mouse_x_previous
	var move_y = device_mouse_y_to_gui(0) - mouse_y_previous
	
	camera_x -= move_x
	camera_y -= move_y
}else{//Base movement

	if (mouse_x < _dead_zone_start_x){

	    camera_x -= 3;
	}
	else if (mouse_x > _dead_zone_end_x){

	    camera_x += 3;
	}
	if (mouse_y < _dead_zone_start_y){

	    camera_y -= 3;
	}
	else if (mouse_y > _dead_zone_end_y){

	    camera_y += 3;
	}
}

//Zooming
var wheel = mouse_wheel_down() - mouse_wheel_up()

if wheel != 0 {
	
	wheel *= 0.1
	
	var add_width = global.cameraWidth * wheel
	var add_height = global.cameraHeight * wheel
	
	global.cameraWidth += add_width
	global.cameraHeight += add_height
	
	if global.cameraWidth < room_width/4.5{
		camera_x -= add_width/2
		camera_y -= add_height/2
	}
}

camera_x = clamp(camera_x, 0, room_width);
camera_y = clamp(camera_y, 0, room_height);

global.cameraWidth = clamp(global.cameraWidth, global.cameraWidth, room_width/4 )
global.cameraHeight = clamp(global.cameraHeight, global.cameraHeight, room_height/4 )



mouse_x_previous = device_mouse_x_to_gui(0)
mouse_y_previous = device_mouse_y_to_gui(0)