function scr_delete_user_node(x1, y1, inst)
{
	instance_destroy(inst);
	
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key)
		
		if (x1 != key_data.x_pos or y1 != key_data.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		key = ds_map_delete(PDG_ROAD_NETWORK, key);
		break;
	}
	
	size = ds_map_size(PDG_ROAD_NETWORK);
	key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++)
	{
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			var structure = scr_extract_user_node_connection_key_values(connections[j]);

			if (x1 == structure.x_pos and y1 == structure.y_pos)
			{
				array_delete(connections, j, 1);
				ds_map_replace(PDG_ROAD_NETWORK, key, connections);
				
				break;
			}
		}
		
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
}
