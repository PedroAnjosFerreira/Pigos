global.cameraWidth = 640
global.cameraHeight = 360
global.windowScale = 4

window_set_fullscreen(true)

dead_zone_size_x = x + global.cameraHeight/10;
dead_zone_size_y = y + global.cameraWidth/10;

camera_speed = 1
screen_width = room_width;
screen_height = room_height;
camera_x = 0;
camera_y = 0;


window_set_size(global.cameraWidth * global.windowScale, global.cameraHeight * global.windowScale)

surface_resize(application_surface, global.cameraWidth, global.cameraHeight)
display_set_gui_size(global.cameraWidth, global.cameraHeight)

//Dragging:

mouse_x_previous = device_mouse_x_to_gui(0)
mouse_y_previous = device_mouse_y_to_gui(0)

