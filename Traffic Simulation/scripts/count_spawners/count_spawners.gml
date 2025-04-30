function count_spawners()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var spawner_count = 0;
	
	for (var i = 0; i < size; i++)
	{
		if (key.junction_type == "SPAWNER") spawner_count ++;

		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return spawner_count;
}

function get_spawner_locations()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	var spawner_locations = [];
	
	for (var i = 0; i < size; i++)
	{
		if (key.junction_type != "SPAWNER")
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		//show_debug_message("Spawner Found");
		
		var x1 = key.x_pos;
		var y1 = key.y_pos;
		
		with (Lane_Node)
		{
			if ((x1 != node_pos[0]) and (y1 != node_pos[1])) continue;
			
			var struct = {
				lane_x: x,
				lane_y: y,
				node_x: x1,
				node_y: y1,
				in: in_conn,
				out: out_conn
				}
			
			array_push(spawner_locations, struct);
		}

		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return remove_spawner_duplicates(spawner_locations);
}

function remove_spawner_duplicates(list)
{
	var new_list = []
	
	for (var i = 0; i < array_length(list); i++)
	{
		var passed = true;
		
		for (var j = 0; j < array_length(new_list); j++)
		{
			if (are_both_structs_equal_advanced(list[i], new_list[j]))
			{
				passed = false;
				break;
			}
		}
		
		if (passed) array_push(new_list, list[i]);
	}
	
	return new_list;
}






