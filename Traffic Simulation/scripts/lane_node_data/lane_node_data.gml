function lane_node_data(x1, y1)
{
	var connections_in = get_connections_to_node(x1, y1);
	var connections_out = get_connections_from_node(x1, y1);
	
	var connection_data = [];
	
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
			speed_limit: connections_in[i].speed_limit
			};
		
		array_push(connection_data, dir_point);
	}
	
	for (var i = 0; i < array_length(connections_out); i++)
	{
		var array_pos = -1;
		var found = false;
		
		var x2 = connections_out[i].x_pos;
		var y2 = connections_out[i].y_pos;
		
		for (var j = 0; j < array_length(connection_data); j++)
		{
			var temp_x = connection_data[j].x_pos;
			var temp_y = connection_data[j].y_pos;
			
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
			speed_limit: connections_out[i].speed_limit
			};
		
		array_push(connection_data, dir_point);
	}
	
	return connection_data;
}








































