network_editor_modes();

try { node_errors(); } catch(e) {}

var size = ds_map_size(PDG_ROAD_NETWORK) ;
var key = ds_map_find_first(PDG_ROAD_NETWORK);

for (var i = 0; i < size - 1; i++;)
{
    var x1 = key.x_pos;
	var y1 = key.y_pos;
	
	var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

	for (var j = 0; j < array_length(connections); j++)
	{
		var structure = connections[j];
		
		var x2 = structure.x_pos;
		var y2 = structure.y_pos;

		draw_line(x1, y1, x2, y2);
	}
	
	key = ds_map_find_next(PDG_ROAD_NETWORK, key);
}

if (ROAD_EDIT_MODE == "CREATE") show_next_node_connection();

//show_debug_message(json_encode(PDG_ROAD_NETWORK));

lane_node_generation(false);

if (pathing == undefined) exit;

draw_set_color(c_purple);

for (var i = 0; i < array_length(pathing) - 1; i++)
{
	var x1 = pathing[i].x_pos;
	var y1 = pathing[i].y_pos;
	var x2 = pathing[i+1].x_pos;
	var y2 = pathing[i+1].y_pos;
	
	draw_line_width(x1,y1,x2,y2,4);
}
draw_set_color(c_white);
























