function scr_count_spawners()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var spawner_count = 0;
	
	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key)
		
		if (key_data.type == "SPAWNER") spawner_count ++;

		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return spawner_count;
}

function scr_get_spawner_locations()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var spawner_locations = [];
	
	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key)
		
		if (key_data.type != "SPAWNER")
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		var x1 = key_data.x_pos;
		var y1 = key_data.y_pos;
		
		with (obj_lane_node)
		{
			if ((x1 != node_pos[0]) and (y1 != node_pos[1])) continue;
			
			var struct = {
				lane_x: x,
				lane_y: y,
				node_x: x1,
				node_y: y1,
				in: self.in_conn,
				out: self.out_conn
			}
			
			array_push(spawner_locations, struct);
		}

		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return remove_spawner_duplicates(spawner_locations);
}
