function get_road_node_type(x1, y1)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size - 1; i++;)
	{
	    // Get first line point
		if (x1 != key.x_pos) or (y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		return key.junction_type;
	}
	
	return "REGULAR";
}

function update_road_type(x1, y1, type)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size - 1; i++;)
	{
	    // Get first line point
		if (x1 != key.x_pos) or (y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		var value = ds_map_find_value(PDG_ROAD_NETWORK, key);
		ds_map_delete(PDG_ROAD_NETWORK, key);
		
		key.junction_type = type;

		ds_map_add(PDG_ROAD_NETWORK, key, value);
		
		break;
	}
}