function scr_get_user_node_type(x1, y1)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size; i++)
	{
	    var key_data = scr_extract_user_node_key_values(key);
		
		// Get first line point
		if (x1 != key_data.x_pos) or (y1 != key_data.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		return key_data.type;
	}
	
	return "REGULAR";
}
