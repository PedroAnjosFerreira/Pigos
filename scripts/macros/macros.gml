#macro SECOND 60
#macro GAME_SPEED game_get_speed(gamespeed_fps)
#macro DELTA 60 / GAME_SPEED

#macro GRID_START { x: 0, y: 0 }
#macro GRID_SIZE 128
#macro GRID_CELL_SIZE 32

#macro D_MOUSE_X device_mouse_x_to_gui(0)
#macro D_MOUSE_Y device_mouse_y_to_gui(0)