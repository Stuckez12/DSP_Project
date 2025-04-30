function scr_calculate_lane_node_position(x1, y1, node_data)
{
	var lane_nodes = [];
	
	for (var i = 0; i < array_length(node_data); i++)
	{
		var a_x = node_data[i].x_pos;
		var a_y = node_data[i].y_pos;

		var neighbouring_point_angle = calculate_min_max_angle_points(node_data, x1, y1, a_x ,a_y);

		var min_x = neighbouring_point_angle[0];
		var min_y = neighbouring_point_angle[1];

		var max_x = neighbouring_point_angle[2];
		var max_y = neighbouring_point_angle[3];
		
		var exit_pos = undefined;
		var entrance_pos = undefined;
		
		var road_speed = scr_get_connection_speed_limit(x1, y1, a_x, a_y);

		if (node_data[i].in)
		{
			entrance_pos = calculate_lane_pos(x1, y1, a_x, a_y, min_x, min_y, -1, 20);
			
			var struct = {
				lane_node_x_pos: precise_round(entrance_pos.x_pos, 2), // Position on the map
				lane_node_y_pos: precise_round(entrance_pos.y_pos, 2),
				node_x_pos: precise_round(x1, 2), // PDG Node directly connected to
				node_y_pos: precise_round(y1, 2),
				conn_node_x_pos: precise_round(a_x, 2), // PDG Node indirectly connected to
				conn_node_y_pos: precise_round(a_y, 2),
				in: true, // Node type
				out: false,
				speed_limit: road_speed,
				order: node_data[i].order
			}

			array_push(lane_nodes, struct);
		}
		
		if (node_data[i].out)
		{
			exit_pos = calculate_lane_pos(x1, y1, a_x, a_y, max_x, max_y, 1, 20);
			
			var struct = {
				lane_node_x_pos: precise_round(exit_pos.x_pos, 2), // Position on the map
				lane_node_y_pos: precise_round(exit_pos.y_pos, 2),
				node_x_pos: precise_round(x1, 2), // PDG Node directly connected to
				node_y_pos: precise_round(y1, 2),
				conn_node_x_pos: precise_round(a_x, 2), // PDG Node indirectly connected to
				conn_node_y_pos: precise_round(a_y, 2),
				in: false, // Node type
				out: true,
				speed_limit: road_speed,
				order: node_data[i].order
			}

			array_push(lane_nodes, struct);	
		}
	}
	
	return lane_nodes;
}
