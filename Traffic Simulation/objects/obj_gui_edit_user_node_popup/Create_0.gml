var gui_height_center = display_get_gui_height() / 2;
var gui_width_center = display_get_gui_width() / 2;

var box_width = 320 / 2;
var box_height = 128 / 2;

var h_min = gui_width_center - box_width;
var v_min = gui_height_center - box_height - 48;

node_type_input = instance_create_depth(x, y, -100, dropdown);
node_type_input.draw_at_x_dropdown = h_min + 32;
node_type_input.draw_at_y_dropdown = v_min + 72;
node_type_input.input_label = "Select junction node type";
node_type_input.current_selected_item = ROAD_TYPE_SELECTED;
node_type_input.all_items = ["REGULAR", "SPAWNER", "SIGNALLED"];

node_spawner_type_input = instance_create_depth(x, y, -99, dropdown);
node_spawner_type_input.draw_at_x_dropdown = h_min + 32;
node_spawner_type_input.draw_at_y_dropdown = v_min + 72 + 72;
node_spawner_type_input.input_label = "Select vehicle spawn rate";
node_spawner_type_input.current_selected_item = ROAD_SPAWNER_TYPE_SELECTED;
node_spawner_type_input.all_items = ["SLOW", "MODERATE", "CONTINUOUS"];