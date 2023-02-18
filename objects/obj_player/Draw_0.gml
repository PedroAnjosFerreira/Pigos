
if select_mode {
	draw_set_color(c_yellow)
	draw_set_alpha(0.2)


	draw_rectangle(start_x, start_y, final_x, final_y, false)
//	draw_circle(start_x,final_y,final_x - start_x, solid)
}
draw_set_color(c_white)
draw_set_alpha(1)

for (i = 0; i < ds_list_size(global.selected_items); i++){
	index += 60
	draw_text(x+index,y,string(ds_list_find_value(global.selected_items,i)))
}