function find_graph_key(x1, y1)
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++)
	{
		if (x1 != key.x_pos or y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		return key;
	}
	
	return noone;
}