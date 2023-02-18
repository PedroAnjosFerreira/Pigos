// Configuration
cameraWidthConfig = 640
cameraHeightConfig = 360
global.fullscreen = false
camera_x = 0;
camera_y = 0;


// Window and Camera
global.cameraWidth = cameraWidthConfig
global.cameraHeight = cameraHeightConfig
maxCameraWidth = cameraWidthConfig * 2
maxCameraHeight = cameraHeightConfig * 2
minCameraWidth = cameraWidthConfig / 2
minCameraHeight = cameraHeightConfig / 2

if(global.fullscreen) global.windowScale = 4
else global.windowScale = 2

window_set_fullscreen(global.fullscreen)

window_set_size(global.cameraWidth * global.windowScale, global.cameraHeight * global.windowScale)

surface_resize(application_surface, global.cameraWidth, global.cameraHeight)
display_set_gui_size(global.cameraWidth, global.cameraHeight)

dead_zone_size_x = x + global.cameraHeight/10;
dead_zone_size_y = y + global.cameraWidth/10;

//Dragging:

mouse_x_previous = device_mouse_x_to_gui(0)
mouse_y_previous = device_mouse_y_to_gui(0)
drag_mode = false