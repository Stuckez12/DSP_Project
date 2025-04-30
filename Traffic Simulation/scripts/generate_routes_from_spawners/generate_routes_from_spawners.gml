function generate_routes_from_spawners()
{
	var spawner_locations = get_spawner_locations();
	
	convert_graph_keys(LPDG_LANE_ROAD_NETWORK);
	
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
			
			var start_pos = {
				x_pos: start_lane_x,
				y_pos: start_lane_y
			}

			var target_pos = {
				x_pos: end_lane_x,
				y_pos: end_lane_y
			}
			
			var path = dijkstra_pathfinding(LPDG_LANE_ROAD_NETWORK, start_pos, target_pos);
			
			if (array_length(path) == 0) continue;
			
			var data = {
				start: start_pos,
				finish: target_pos,
				route: path
				}
				
			array_push(SIMULATION_GENERATED_PATHS, data);
		}
	}
}





































