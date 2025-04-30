function scr_generate_middle_lane_nodes(x1, y1, x2, y2, _speed, conn_node_pos)
{
	var dist = pythagorus(x1, y1, x2, y2);
	
	var speed_dist = int64(_speed) * 4;
	var count_point_dist = dist / speed_dist;
	
	var new_points = count_point_dist div 1;
	var equal_point_dist = dist / new_points;
	
	if (new_points == 0) return string(precise_round(x2, 2)) + "|" + string(precise_round(y2, 2));
	
	var _dir = calculate_point_angle(x1, y1, x2, y2);
	
	var prev_x = x2;
	var prev_y = y2;
	
	var curr_x = 0;
	var curr_y = 0;
	
	for (var i = new_points - 1; i > 0; i--)
	{
		var point_dist = i * equal_point_dist;
		
		curr_x = precise_round(x1 + calculate_triangle_base_with_hypotenuse_opp_angle(point_dist, _dir), 2);
		curr_y = precise_round(y1 + calculate_triangle_opp_with_hypotenuse_opp_angle(point_dist, _dir), 2);
		
		var lane_node = instance_create_depth(curr_x, curr_y, 0, obj_lane_node);

		lane_node.node_pos = [undefined, undefined];
		lane_node.other_connections = [string(prev_x) + "|" + string(prev_y)];
		lane_node.conn_node_pos = conn_node_pos;
		lane_node.connecting_node = true;
		lane_node.speed_limit = _speed;
		lane_node.lane_node_pos = [curr_x, curr_y];

		prev_x = curr_x;
		prev_y = curr_y;
	}
	
	return string(precise_round(prev_x, 2)) + "|" + string(precise_round(prev_y, 2));
}
