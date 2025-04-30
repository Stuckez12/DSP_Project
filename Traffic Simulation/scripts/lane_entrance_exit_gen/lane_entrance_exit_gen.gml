function lane_entrance_exit_gen(x1, y1, node_data)
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
		
		var road_speed = get_road_speed_from_line_coords(x1, y1, a_x, a_y);

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
				speed_limit: road_speed
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
				speed_limit: road_speed
				}
				
			array_push(lane_nodes, struct);	
		}
	}
	
	return lane_nodes;
}


function calculate_min_max_angle_points(node_data, x1, y1, p_x, p_y)
{
	var min_angle = 500;
	var max_angle = -500;

	var min_point = [0, 0]; // [X, Y]
	var max_point = [0, 0]; // [X, Y]
	
	for (var i = 0; i < array_length(node_data); i++)
	{
		var p_x2 = node_data[i].x_pos;
		var p_y2 = node_data[i].y_pos;
		
		if (p_x == p_x2) continue;
		if (p_y == p_y2) continue;
		
		var angle = angle_between_points(x1, y1, p_x, p_y, p_x2, p_y2);
		
		if (angle < min_angle)
		{
			min_angle = angle;
			min_point = [node_data[i].x_pos, node_data[i].y_pos];
		}
		if (angle > max_angle)
		{
			max_angle = angle;
			max_point = [node_data[i].x_pos, node_data[i].y_pos];
		}
	}
	
	return array_concat(min_point, max_point);
}


























