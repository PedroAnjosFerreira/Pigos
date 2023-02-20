if other.id == assigned_to {
	
	var _item = instance_create_layer(x,y,"Items", obj_picked_item, {sprite: sprite_index, assigned_minion: other.id, item_id: id})
	other.picked_item(_item)

	instance_destroy()
}