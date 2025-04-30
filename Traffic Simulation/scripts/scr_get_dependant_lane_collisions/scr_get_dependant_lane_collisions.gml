function scr_get_dependant_lane_collisions(lane_pos, inc_conn, out_conn)
{
	var inc_main = !lane_pos[0].is_joining ? 2 : 0;
	var out_main = !lane_pos[1].is_joining ? 1 : 0;

	var lane_result = inc_main + out_main;
	
	var line_collision_points = [];
	
	line_collision_points = array_concat(line_collision_points, scr_get_direct_lane_merging_connections(lane_pos, inc_conn));
	
	switch (lane_result)
	{
		case 0: // from non main connection to non main connection [0, 0]
			line_collision_points = array_concat(line_collision_points, scr_get_extended_road_connection_lines(lane_pos, inc_conn, true, line_collision_points));
			line_collision_points = array_concat(line_collision_points, scr_get_extended_road_connection_lines(lane_pos, inc_conn, false, line_collision_points));
			break;

		case 1: // from non main connection to main connection [0, 1]
			line_collision_points = array_concat(line_collision_points, scr_get_extended_road_connection_lines(lane_pos, inc_conn, false, line_collision_points));
			break;

		case 2: // from main connection to non main connection [1, 0]
			line_collision_points = array_concat(line_collision_points, scr_get_extended_road_connection_lines(lane_pos, inc_conn, false, line_collision_points));
			break;

		case 3: // from main connection to main connection [1, 1]
			break;
	}

	return line_collision_points;
}

function scr_get_direct_lane_merging_connections(lane_pos, inc_conn)
{
	/*
	This function gets all the lanes that come from connections other
	than the currently searching connection and generates the coords
	for line collision used to check if there is a vehicle that is
	currently obstructing the specified path through the junction for
	the designated route.
	
	It also gets all connections that intersect the current pathway
	provided to the function
	*/
	
	var inc_lane = lane_pos[0];
	
	var x1 = inc_lane.x_pos;
	var y1 = inc_lane.y_pos;
	
	var out_lane = lane_pos[1];
	
	var x2 = out_lane.x_pos;
	var y2 = out_lane.y_pos;
	
	var line_collision_points = [];
	
	for (var i = 0; i < array_length(inc_conn); i++)
	{
		var other_lane_in = inc_conn[i];
		
		if (other_lane_in.x_pos == x1) and (other_lane_in.y_pos == y1) continue;
		
		var connections = other_lane_in.lane_conns;
		
		for (var j = 0; j < array_length(connections); j++)
		{
			var conn_data = scr_extract_lane_connection_key_values(connections[j]);
			
			var x3 = conn_data.x_pos;
			var y3 = conn_data.y_pos;
			
			var pass = true;
			var struct = {}
			
			if (x3 != x2) or (y3 != y2)
			{
				var collision = line_intersection(x1, y1, x2, y2, other_lane_in.x_pos, other_lane_in.y_pos, x3, y3);
				
				if !collision.result continue;
				
				struct = {
					x1: other_lane_in.x_pos,
					y1: other_lane_in.y_pos,
					x2: x3,
					y2: y3,
					direct: false,
				}
			}
			else
			{
				struct = {
					x1: other_lane_in.x_pos,
					y1: other_lane_in.y_pos,
					x2: x2,
					y2: y2,
					direct: true,
				}
			}
			
			array_push(line_collision_points, struct);
		}
	}
	
	return line_collision_points;
}
