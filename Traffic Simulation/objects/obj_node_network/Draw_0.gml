if (ROAD_EDIT_MODE == "CREATE") and (LAST_NODE != undefined) and (!SIMULATION_ACTIVE)
{
	var last_node_data = scr_extract_user_node_key_values(LAST_NODE);
	
	draw_line(mouse_x, mouse_y, last_node_data.x_pos, last_node_data.y_pos);
}

try { node_errors(); } catch(e) {}

if !DEBUG_LINES exit;
if !SIMULATION_ACTIVE exit;
if array_length(SIMULATION_GENERATED_PATHS) == 0 exit;

exit;

if keyboard_check_pressed(ord("2")) ppos --;
if keyboard_check_pressed(ord("3")) ppos ++;


if (ppos > array_length(SIMULATION_GENERATED_PATHS) - 1) ppos = 0;
if (ppos < 0) ppos = array_length(SIMULATION_GENERATED_PATHS) - 1;

pathing = SIMULATION_GENERATED_PATHS[ppos].route

for (var i = 0; i < array_length(pathing) - 1; i++)
{
	var f = scr_extract_lane_connection_key_values(pathing[i]);
	var s = scr_extract_lane_connection_key_values(pathing[i+1]);

	var x1 = f.x_pos;
	var y1 = f.y_pos;
	var x2 = s.x_pos;
	var y2 = s.y_pos;
	
	draw_line_width(x1, y1, x2, y2, 4);
}


