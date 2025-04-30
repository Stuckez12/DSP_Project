function scr_get_connection_speed_limit(x1, y1, x2, y2)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var line_distance = infinity;
	var points = [];

	for (var i = 0; i < size; i++;)
	{
	    var key_data = scr_extract_user_node_key_values(key)
		
		// Get first line point
		if (x1 != key_data.x_pos) or (y1 != key_data.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		// Get and search through all second points
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			// Get second line point
			var structure = scr_extract_user_node_connection_key_values(connections[j]);
		
			if (x2 != structure.x_pos) continue;
			if (y2 != structure.y_pos) continue;
			
			return structure.speed_limit;
		}
	
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return 0;
}
