function scr_place_vehicle_spawners()
{
	var paths = scr_seperate_vehicle_paths();
	
	for (var i = 0; i < array_length(paths); i++)
	{
		var start = paths[i].start_pos;
		
		var x1 = start.x_pos;
		var y1 = start.y_pos;
		
		var user_node_key = paths[i].paths[0].start_user_node_key;
		
		var element_spawner = instance_create_layer(x1, y1, "Vehicles", obj_vehicle_spawner);
		
		element_spawner.type = scr_get_user_node_spawner_type(user_node_key);
		array_copy(element_spawner.routes, 0, paths[i].paths, 0, array_length(paths[i].paths));
	}
}

function scr_seperate_vehicle_paths()
{
	var pathing_pos = [];
	
	for (var i = 0; i < array_length(SIMULATION_GENERATED_PATHS); i++)
	{
		var path_data = SIMULATION_GENERATED_PATHS[i];
		var path_pos = -1;

		for (var j = 0; j < array_length(pathing_pos); j++)
		{
			var path_list = pathing_pos[j];
			
			if (scr_create_lane_node_connection_key_from_struct(path_list.start_pos) == scr_create_lane_node_connection_key_from_struct(path_data.start))
			{
				path_pos = j;
				break;
			}
		}

		if (path_pos == -1)
		{
			var struct = {
				start_pos: path_data.start,
				paths: [path_data]
			}
			
			array_push(pathing_pos, struct);
		}
		else array_push(pathing_pos[path_pos].paths, path_data);
	}
	
	return pathing_pos;
}

function scr_get_user_node_spawner_type(key)
{
	var key_data = scr_extract_user_node_key_values(key);
	
	with (obj_user_node) if (key_data.x_pos == self.x_pos) and (key_data.x_pos == self.x_pos) return self.spawner_type;
	
	return "MODERATE";
}