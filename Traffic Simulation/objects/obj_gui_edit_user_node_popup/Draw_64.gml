var gui_height_center = display_get_gui_height() / 2;
var gui_width_center = display_get_gui_width() / 2;

var box_width = 320 / 2;
var box_height = 192 / 2;

var h_min = gui_width_center - box_width;
var v_min = gui_height_center - box_height;
		
draw_set_color(c_grey);
draw_rectangle(gui_width_center - box_width, gui_height_center - box_height ,gui_width_center + box_width, gui_height_center + box_height, false);
draw_set_color(c_white);

try
{
	if (global.error_set_node_type_timer > 0)
	{
		global.error_set_node_type_timer -= 1;
		draw_text(h_min + 32, v_min + 72 + 32 + 64, global.error_set_node_type_message);
	}
}
catch(e){}