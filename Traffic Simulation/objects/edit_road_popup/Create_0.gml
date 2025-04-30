var gui_height_center = display_get_gui_height() / 2;
var gui_width_center = display_get_gui_width() / 2;

var box_width = 320 / 2;
var box_height = 128 / 2;


var h_min = gui_width_center - box_width;
var v_min = gui_height_center - box_height;


speed_input = instance_create_depth(x, y, -100, textbox);

speed_input.input_label = "Input Road Speed (10 - 120)"
speed_input.draw_at_x = h_min + 128 + 32;
speed_input.draw_at_y = v_min + 72;
speed_input.type_input = "int";
speed_input.text = string(ROAD_SPEED_SELECTED);