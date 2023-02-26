if id == other.assigned_to {
	var _item = instance_create_layer(x,y,"Items", obj_picked_item, new PickedItem(other.item_sprite,id,other.id))
	pegou_item(_item)
	instance_destroy(other)
}