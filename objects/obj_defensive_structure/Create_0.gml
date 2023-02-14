/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




// Inherit the parent event
event_inherited();

clicked = false

function selected(__selected) {
  if (__selected == true) {

    upgrade_menu = instance_create_depth(x + 32, y - 32, 1, obj_upgrade_menu, {structure: self});
    upgrade_menu.structure = id;
  }else {
	instance_destroy(obj_upgrade_menu)
  }
}