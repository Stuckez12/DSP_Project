function scr_generate_vehicle_routes()
{
	var spawner_locations = scr_get_spawner_locations();

	for (var i = 0; i < array_length(spawner_locations); i++)
	{
		if !spawner_locations[i].out continue;
		
		var start_lane_x = spawner_locations[i].lane_x;
		var start_lane_y = spawner_locations[i].lane_y;
		var start_node_x = spawner_locations[i].node_x;
		var start_node_y = spawner_locations[i].node_y;
		
		for (var j = 0; j < array_length(spawner_locations); j++)
		{
			if !spawner_locations[j].in continue;
			
			var end_lane_x = spawner_locations[j].lane_x;
			var end_lane_y = spawner_locations[j].lane_y;
			var end_node_x = spawner_locations[j].node_x;
			var end_node_y = spawner_locations[j].node_y;
			
			if ((start_lane_x == end_lane_x) and (start_lane_y == end_lane_y)) continue;
			if ((start_node_x == end_node_x) and (start_node_y == end_node_y)) continue;
			
			var start_pos = string(start_lane_x) + "|" + string(start_lane_y);
			var target_pos = string(end_lane_x) + "|" + string(end_lane_y);
			
			var path = scr_dijkstra_pathfinding(LPDG_LANE_ROAD_NETWORK, start_pos, target_pos);
			
			if (array_length(path) == 0) continue;
			
			var data = {
				start: scr_extract_lane_connection_key_values(start_pos),
				finish: scr_extract_lane_connection_key_values(target_pos),
				route: path,
				start_user_node_key: string(start_node_x) + "|" + string(start_node_y) + "|SPAWNER"
			}

			array_push(SIMULATION_GENERATED_PATHS, data);
		}
	}
}
