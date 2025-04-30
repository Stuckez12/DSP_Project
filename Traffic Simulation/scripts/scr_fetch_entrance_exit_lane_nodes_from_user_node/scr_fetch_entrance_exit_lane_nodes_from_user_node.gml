function scr_fetch_entrance_exit_lane_nodes_from_user_node(x1, y1)
{
	var connections_in = scr_get_connections_to_node(x1, y1);
	var connections_out = scr_get_connections_from_node(x1, y1);
	
	var connection_data = [];
	
	connections_in = scr_order_by_angle(x1, y1, connections_in, false);
	connections_out = scr_order_by_angle(x1, y1, connections_out, true);
	
	for (var i = 0; i < array_length(connections_in); i++)
	{
		var x2 = connections_in[i].x_pos;
		var y2 = connections_in[i].y_pos;
		
		var angle = calculate_point_angle(x1, y1, x2, y2);
		
		var dir_point = {
			x_pos: x2,
			y_pos: y2,
			dir_to_point: angle,
			out: false,
			in: true,
			speed_limit: connections_in[i].speed_limit,
			order: i
		}

		array_push(connection_data, dir_point);
	}
	
	for (var i = 0; i < array_length(connections_out); i++)
	{
		var array_pos = -1;
		var found = false;
		
		var conn_key_data = scr_extract_user_node_key_values(connections_out[i]);
		
		var x2 = conn_key_data.x_pos;
		var y2 = conn_key_data.y_pos;
		
		for (var j = 0; j < array_length(connection_data); j++)
		{
			var temp_conn_key_data = scr_extract_user_node_key_values(connections_out[j]);
			
			var temp_x = temp_conn_key_data.x_pos;
			var temp_y = temp_conn_key_data.y_pos;
			
			if (temp_x == x2 and temp_y == y2)
			{
				array_pos = j;
				found = true;
			}
		}
		
		if found
		{
			connection_data[array_pos].out = true;
			continue;
		}
		
		var angle = calculate_point_angle(x1, y1, x2, y2);
		
		var dir_point = {
			x_pos: x2,
			y_pos: y2,
			dir_to_point: angle,
			out: true,
			in: false,
			speed_limit: connections_out[i].speed_limit,
			order: i
		}
		
		array_push(connection_data, dir_point);
	}
	
	return connection_data;
}
