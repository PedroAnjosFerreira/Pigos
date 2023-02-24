/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




// Inherit the parent event
event_inherited();
enum gui_state {
    open,
    closed
}

_x = 0
_y = 0
gui = gui_state.closed
first_click = false
clicked = false
<<<<<<< Updated upstream
menu_clicked = false
state = function(){}
=======
range = 0

function selected(__selected) {
  if (__selected == true) {

    upgrade_menu = instance_create_depth(x + 32, y - 32, 1, obj_upgrade_menu, {structure: self});
    upgrade_menu.structure = id;
  }else {
	instance_destroy(obj_upgrade_menu)
  }
}
>>>>>>> Stashed changes
