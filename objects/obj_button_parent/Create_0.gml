gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

button_sprite = sprite_add("Sprite9", 1, false, false, 0, 0);

var _button = instance_create_layer(gui_width - 100, gui_height - 50, "GUI", obj_button);
_button.sprite_index = button_sprite;
_button.image_speed = 0;