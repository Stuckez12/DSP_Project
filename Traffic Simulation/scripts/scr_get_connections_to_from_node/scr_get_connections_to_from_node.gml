function scr_get_connections_to_node(x1, y1)
{
	var all_points_to_node = [];
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++;)
	{
		var key_data = scr_extract_user_node_key_values(key);
		
		var x2 = key_data.x_pos;
		var y2 = key_data.y_pos;
		
		if ((x1 == x2) and (y1 == y2)) { key = ds_map_find_next(PDG_ROAD_NETWORK, key); continue; }
		
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			var structure = scr_extract_user_node_connection_key_values(connections[j]);

			if (x1 == structure.x_pos and y1 == structure.y_pos)
			{
				var data = {
					x_pos: x2,
					y_pos: y2,
					speed_limit: structure.speed_limit
				}
				
				array_push(all_points_to_node, data);
				break;
			}
		}
		
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return all_points_to_node;
}

function scr_get_connections_from_node(x1, y1)
{
	var node_key = scr_get_node_key_from_pos(x1, y1);
	
	var data = ds_map_find_value(PDG_ROAD_NETWORK, node_key);
	
	return ds_map_find_value(PDG_ROAD_NETWORK, node_key);
}
