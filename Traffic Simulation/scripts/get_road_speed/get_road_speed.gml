function get_road_speed_from_line_coords(x1, y1, x2, y2)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var line_distance = infinity;
	var points = [];

	for (var i = 0; i < size - 1; i++;)
	{
	    // Get first line point
		if (x1 != key.x_pos) or (y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		// Get and search through all second points
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			// Get second line point
			var structure = connections[j];
		
			if (x2 != structure.x_pos) continue;
			if (y2 != structure.y_pos) continue;
			
			return structure.speed_limit;
		}
	
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return 0;
}


function update_road_speed(x1, y1, x2, y2, new_speed)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var line_distance = infinity;
	var points = [];

	for (var i = 0; i < size - 1; i++;)
	{
	    // Get first line point
		if (x1 != key.x_pos) or (y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		// Get and search through all second points
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);
		var structure = noone;
		var j = 0;
		var found = false;

		for (j = 0; j < array_length(connections); j++)
		{
			// Get second line point
			structure = connections[j];
		
			if (x2 != structure.x_pos) continue;
			if (y2 != structure.y_pos) continue;
			
			structure.speed_limit = new_speed;
			found = true;
			
			break;
		}
		
		// If line not found skip
		if (!found)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		// Replace the line data with new data
		connections[j] = structure;
		
		ds_map_replace(PDG_ROAD_NETWORK, key, connections);
	
		return true;
	}
	
	return false;
}