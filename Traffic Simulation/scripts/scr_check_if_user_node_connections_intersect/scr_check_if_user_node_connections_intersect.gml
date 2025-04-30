function scr_check_if_user_node_connections_intersect(x3, y3, x4, y4)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key)
		
		var x1 = key_data.x_pos;
		var y1 = key_data.y_pos;
	
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			
			var structure = scr_extract_user_node_connection_key_values(connections[j]);
		
			var x2 = structure.x_pos;
			var y2 = structure.y_pos;
			
			var intersection = line_intersection(x1, y1, x2, y2, x3, y3, x4, y4);
			
			if intersection.result
			{
				if (intersection.t == 1 or intersection.t == 0) continue;
				if (intersection.u == 1 or intersection.u == 0) continue;
				
				return intersection;
			}
		}
	
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return { result: false };
}

function scr_do_two_connections_intersect(node_key1, node_key2)
{
	var key_data1 = scr_extract_user_node_key_values(node_key1);
	var key_data2 = scr_extract_user_node_key_values(node_key2);
		
	var intersecting = scr_check_if_user_node_connections_intersect(key_data1.x_pos, key_data1.y_pos, key_data2.x_pos, key_data2.y_pos);
	
	if intersecting.result
	{
		global.error_create_edge_x = intersecting.x_pos;
		global.error_create_edge_y = intersecting.y_pos;
		global.error_create_edge_timer = 100;
		global.error_create_edge_message = "Connections between nodes cannot cross!";
		
		return true;
	}
	
	return false;
}
