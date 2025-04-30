function scr_check_last_node_exists()
{
	if (LAST_NODE == undefined) return false;
	
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var last_node_data = scr_extract_user_node_key_values(LAST_NODE);
	
	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key);
		
		if (last_node_data.x_pos != key_data.x_pos or last_node_data.y_pos != key_data.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		return true;
	}
	
	return false;
}
