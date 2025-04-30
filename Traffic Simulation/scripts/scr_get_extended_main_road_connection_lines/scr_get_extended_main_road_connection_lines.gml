function scr_get_extended_road_connection_lines(lane_pos, inc_conn, main_conn, current_colliding_lines)
{
	var inc_lane = lane_pos[0];
	var x1 = inc_lane.x_pos;
	var y1 = inc_lane.y_pos;

	var out_lane = lane_pos[1];
	var x2 = out_lane.x_pos;
	var y2 = out_lane.y_pos;
	
	var in_order = scr_get_lane_node_order(x1, y1);
	var out_order = scr_get_lane_node_order(x2, y2);	
	var line_collision_points = [];
	
	for (var i = 0; i < array_length(inc_conn); i++)
	{
		var lane_in = inc_conn[i];

		if (lane_in.is_joining != main_conn) continue;
		
		var x3 = lane_in.x_pos;
		var y3 = lane_in.y_pos;
		var connected = false;
		
		for (var j = 0; j < array_length(current_colliding_lines); j++)
		{
			var line = current_colliding_lines[j];
			
			if (line.x1 == x3) and (line.y1 == y3) { connected = true; break; }
		}
		
		if !connected continue;
		
		var current_order = scr_get_lane_node_order(x3, y3);
		
		if scr_within_order(current_order, in_order, out_order)
		{ 
			if (out_lane.is_joining == main_conn) and (out_lane.is_joining) continue;
			else if (out_lane.is_joining != main_conn) and (!out_lane.is_joining) continue;
		}
		else if (!inc_lane.is_joining) continue;
		
		if (x1 == x3) and (y1 == y3) continue;
		
		var _dir = lane_in._dir;
		var _dist = lane_in._dist * 0.3;
		
		var x4 = x3 + calculate_triangle_base_with_hypotenuse_opp_angle(_dist, _dir);
		var y4 = y3 + calculate_triangle_opp_with_hypotenuse_opp_angle(_dist, _dir);

		var struct = {
			x1: x3,
			y1: y3,
			x2: x4,
			y2: y4,
			direct: false,
		}
			
		array_push(line_collision_points, struct);
	}
	
	return line_collision_points;
}

