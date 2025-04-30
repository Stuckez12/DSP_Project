function scr_assign_main_road_connections(junc_node)
{
	var inc_conn = junc_node.incoming_connections;
	var out_conn = junc_node.outgoing_connections;
	
	var key_data = scr_extract_user_node_key_values(junc_node.user_node_key);
	
	var angle_connections = [];
	
	for (var i = 0; i < array_length(inc_conn); i++)
	{
		var inc_lane = inc_conn[i];
		
		var x1 = inc_lane.user_conn_x_pos;
		var y1 = inc_lane.user_conn_y_pos;
		
		for (var j = i; j < array_length(out_conn); j++)
		{
			var out_lane = inc_conn[j];
			
			var x2 = out_lane.user_conn_x_pos;
			var y2 = out_lane.user_conn_y_pos;
		
			if (x1 == x2) and (y1 == y2) continue;
			
			var angle = angle_between_points(key_data.x_pos, key_data.y_pos, x1, y1, x2, y2);
			
			angle = scr_normalize_angle(angle);
			
			var conn_key = string(x1) + "|" + string(y1) + "|" + string(x2) + "|" + string(y2);
			
			var struct = {
				user_key: conn_key,
				angle: angle
			}

			array_push(angle_connections, struct);
		}
	}
	
	var largest_angle = angle_connections[0].angle;
	var key = angle_connections[0].user_key;
	
	for (var i = 1; i < array_length(angle_connections); i++)
	{
		if (largest_angle < angle_connections[i].angle)
		{
			largest_angle = angle_connections[i].angle;
			key = angle_connections[i].user_key;
		}
	}
	
	var pos = string_split(key, "|");
	
	var x1 = pos[0];
	var y1 = pos[1];

	var x2 = pos[2];
	var y2 = pos[3];

	for (var i = 0; i < array_length(inc_conn); i++)
	{
		var struct = inc_conn[i];
		
		var x3 = struct.user_conn_x_pos;
		var y3 = struct.user_conn_y_pos;
		
		if ((y3 == y2) and (x3 == x2)) or ((y3 == y1) and (x3 == x1))
		{
			struct.is_joining = false;
			inc_conn[i] = struct;
		}
	}
	
	for (var i = 0; i < array_length(out_conn); i++)
	{
		var struct = out_conn[i];
		
		var x3 = struct.user_conn_x_pos;
		var y3 = struct.user_conn_y_pos;
		
		if ((y3 == y2) and (x3 == x2)) or ((y3 == y1) and (x3 == x1))
		{
			struct.is_joining = false;
			out_conn[i] = struct;
		}
	}
	
	junc_node.incoming_connections = inc_conn;
	
	var main_conn_1 = {
		x_pos: x1,
		y_pos: y1,
		_dir: true_point_direction(key_data.x_pos, key_data.y_pos, x1, y1)
	}
	
	var main_conn_2 = {
		x_pos: x2,
		y_pos: y2,
		_dir: true_point_direction(key_data.x_pos, key_data.y_pos, x2, y2)
	}
	
	array_push(junc_node.main_connections, main_conn_1, main_conn_2);
}

function scr_normalize_angle(angle)
{
    angle = angle mod 360;
    if (angle < 0) angle += 360;
    if (angle > 180) return 360 - angle;
    return angle;
}

function scr_assign_user_conn_nodes(junc_node)
{
	var inc_conn = junc_node.incoming_connections;
	var out_conn = junc_node.outgoing_connections;
	
	var all_lane_nodes = array_concat(inc_conn, out_conn);
	var all_user_nodes = [];
	
	for (var i = 0; i < array_length(all_lane_nodes); i++)
	{
		var node = all_lane_nodes[i];
		
		var x1 = node.user_conn_x_pos;
		var y1 = node.user_conn_y_pos;
		
		var exists = false;
		
		for (var j = 0; j < array_length(all_user_nodes); j++)
		{
			var user_node = all_user_nodes[j];
			if (user_node.x_pos == x1) and (user_node.y_pos == y1) { exists = true; break; }
		}
		
		if exists continue;
		
		array_push(all_user_nodes, { x_pos: x1, y_pos: y1 });
	}
	
	junc_node.all_connections = all_user_nodes;
}













































