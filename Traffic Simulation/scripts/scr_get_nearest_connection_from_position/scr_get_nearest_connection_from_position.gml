function scr_get_nearest_connection_from_position(x_pos, y_pos)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var line_distance = infinity;
	var points = [];

	for (var i = 0; i < size; i++)
	{
	    var key_data = scr_extract_user_node_key_values(key);
		
		// Get first line point
		var x1 = key_data.x_pos;
		var y1 = key_data.y_pos;
		
		// Get and search through all second points
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			// Get second line point
			var structure = scr_extract_user_node_connection_key_values(connections[j]);
		
			var x2 = structure.x_pos;
			var y2 = structure.y_pos;
			
			// Check if mouse is outside of bounding point box
			var min_x = min(x1, x2);
			var max_x = max(x1, x2);
			var min_y = min(y1, y2);
			var max_y = max(y1, y2);
			
			if (y_pos > max_y or y_pos < min_y) continue;
			if (x_pos > max_x or x_pos < min_x) continue;
			
			// Check if mouse is closest to line
			var distance = is_point_near_line(x_pos, y_pos, x1, y1, x2, y2);
			if (distance >= line_distance) continue;
			
			// Update shortest distance line
			line_distance = distance;
			points = [x1, y1, x2, y2];
		}
	
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return points;
}
