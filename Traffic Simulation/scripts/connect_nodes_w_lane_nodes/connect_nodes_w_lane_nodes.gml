function connect_nodes_w_lane_nodes()
{
	with (Lane_Node)
	{
		var x1 = x;
		var y1 = y;
		
		var parent_node_pos = node_pos;
		var parent_conn_node_pos = conn_node_pos;
		
		if (out_conn)
		{
			var struct = {}
			var passed = false;
			
			with (Lane_Node)
			{
				if (!are_arrays_equal(parent_conn_node_pos, node_pos)) continue;
				if (!are_arrays_equal(parent_node_pos, conn_node_pos)) continue;

				if (out_conn) continue;

				struct = { x_pos: precise_round(x, 2), y_pos: precise_round(y, 2) }
				
				// Add function code here to spawn in equally distributed lane nodes
				
				passed = true
			}
			
			if (passed) array_push(other_connections, struct);
		}
	}
}

