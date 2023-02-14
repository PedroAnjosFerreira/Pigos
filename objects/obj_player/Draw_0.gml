
if select_mode {
	draw_set_color(c_yellow)
	draw_set_alpha(0.2)


	draw_rectangle(start_x, start_y, final_x, final_y, false)
//	draw_circle(start_x,final_y,final_x - start_x, solid)
}
draw_set_color(c_white)
draw_set_alpha(1)
draw_text(x+60,y,global.selection_type)