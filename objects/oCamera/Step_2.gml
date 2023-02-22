if camera_activated {
	var _dead_zone_start_x = camera_x + (global.cameraWidth - dead_zone_size_x) / 11;
	var _dead_zone_end_x = camera_x + (global.cameraWidth + dead_zone_size_x)/1.1;

	var _dead_zone_start_y = camera_y + (global.cameraHeight - dead_zone_size_y) / 10;
	var _dead_zone_end_y = camera_y + (global.cameraHeight + dead_zone_size_y) / 1.2;

	var mouse_x_current = device_mouse_x_to_gui(0)
	var mouse_y_current = device_mouse_y_to_gui(0)

	camera_x_center = cameraWidthConfig / 2
	camera_y_center = cameraHeightConfig / 2

	//Dragging:
	if mouse_check_button(mb_middle){
		var move_x = mouse_x_current - mouse_x_previous
		var move_y = mouse_y_current - mouse_y_previous

		camera_x -= move_x
		camera_y -= move_y
	
		drag_mode = true
	}

	//Zooming
	var wheel = mouse_wheel_down() - mouse_wheel_up()
	//show_debug_message(string(mouse_x_current))
	//show_debug_message(global.cameraWidth/10)

	if wheel != 0 {
		var add_width = wheel * (cameraWidthConfig/5)
		var add_height = wheel * (cameraHeightConfig/5)
	
		global.cameraWidth += add_width
		global.cameraHeight += add_height
		global.cameraWidth = clamp(global.cameraWidth, minCameraWidth, maxCameraWidth)
		global.cameraHeight = clamp(global.cameraHeight, minCameraHeight, maxCameraHeight)
	
		// Maps the current zoom to a percentage that will be used to control
		// the amount of walking that the camera will do while zooming at the mouse
		var min_zoom = 0.2
		var max_zoom = 0.7
		var zoomPercentage = (global.cameraWidth - minCameraWidth) * (max_zoom - min_zoom) / (maxCameraWidth - minCameraWidth) + min_zoom
	
		// Walks a little bit to the mouse location
		var camera_offset_x = mouse_x_current - camera_x_center
		camera_x = lerp(camera_x, camera_x + camera_offset_x, zoomPercentage)
		var camera_offset_y = mouse_y_current - camera_y_center
		camera_y = lerp(camera_y, camera_y + camera_offset_y, zoomPercentage)
	}

	// Updating camera's X and Y values
	camera_x = clamp(camera_x, 0, room_width);
	camera_y = clamp(camera_y, 0, room_height);

	// Camera scales updates for zoom effect
	camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight)

	// Camera position updating
	camera_set_view_pos(view_camera[0],camera_x,camera_y)

	// Drag variables reset
	mouse_x_previous = mouse_x_current
	mouse_y_previous = mouse_y_current
	drag_mode = false
}