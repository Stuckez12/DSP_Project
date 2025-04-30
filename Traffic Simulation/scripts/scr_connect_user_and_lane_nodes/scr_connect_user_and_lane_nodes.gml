function scr_connect_user_and_lane_nodes()
{
	with (obj_lane_node)
	{
		var x1 = x;
		var y1 = y;
		
		var parent_node_pos = node_pos;
		var parent_conn_node_pos = conn_node_pos;
		var _speed = speed_limit;
		
		if (connecting_node) continue;
		
		if (out_conn)
		{
			var key = "";
			var connections_gen = false;
			var passed = false;
			
			with (obj_lane_node)
			{
				if (!are_arrays_equal(parent_conn_node_pos, node_pos)) continue;
				if (!are_arrays_equal(parent_node_pos, conn_node_pos)) continue;

				if (out_conn) continue;

				var x2 = x;
				var y2 = y;

				key = scr_generate_middle_lane_nodes(x1, y1, x2, y2, _speed, parent_conn_node_pos);
				
				passed = true
			}
			
			if (passed) array_push(other_connections, key);
		}
	}
}
