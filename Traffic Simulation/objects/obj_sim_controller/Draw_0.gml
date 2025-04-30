if !DEBUG_LINES exit;
if !SIMULATION_ACTIVE exit;
if array_length(SIMULATION_GENERATED_PATHS) == 0 exit;

var path = SIMULATION_GENERATED_PATHS[pos].route;
	
for (var i = 0; i < array_length(path) - 1; i++)
{
	var pos_1 = scr_extract_lane_connection_key_values(path[i]);
	var pos_2 = scr_extract_lane_connection_key_values(path[i+1]);
	
	var x1 = pos_1.x_pos;
	var y1 = pos_1.y_pos;
	var x2 = pos_2.x_pos;
	var y2 = pos_2.y_pos;
	
	draw_set_color(c_white);
	draw_line_width(x1, y1, x2, y2, 16);
}
