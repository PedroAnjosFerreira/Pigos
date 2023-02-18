assigned_to = noone
picked = false
image_speed = 0
function selected(_true){
	if _true{
		ds_list_add(global.selected_items, self)
		image_blend = c_yellow
	}else{
		image_blend = c_white
	}
}