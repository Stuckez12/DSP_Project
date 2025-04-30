switch (type)
{
	case "REGULAR": break;
	case "SPAWNER": draw_set_color(c_yellow); break;
	case "SIGNALLED": draw_set_color(c_green); break;
}

draw_circle(x, y, 4, false);
draw_set_color(c_white);

if !SIMULATION_ACTIVE
{
	var distance = pythagorus(mouse_x, mouse_y, x, y);
	
	var max_distance = 128;
	
	if (ROAD_EDIT_MODE != "CREATE") max_distance /= 2;
	
	if distance < max_distance
	{
		if (ROAD_EDIT_MODE == "CREATE") draw_line(mouse_x, mouse_y, x, y);

		draw_set_alpha(0.25);
		draw_circle(x, y, max_distance, false);
		draw_set_alpha(1);
	}
	else
	{
		draw_set_alpha(0.1);
		draw_circle(x, y, max_distance, false);
		draw_set_alpha(1);
	}
}

var key = string(x_pos) + "|" + string(y_pos) + "|" + string(type);
var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

for (var i = 0; i < array_length(connections); i++)
{
	var conn_key = scr_extract_user_node_connection_key_values(connections[i]);
	
	if (!SIMULATION_ACTIVE) draw_line(x, y, conn_key.x_pos, conn_key.y_pos);
}



var display = "X: " + string(x_pos) + " | Y: " + string(y_pos);

draw_set_color(c_blue);
draw_text_transformed(x, y, display, 0.75, 0.75, 35);
draw_set_color(c_white);