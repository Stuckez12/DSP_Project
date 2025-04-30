function lane_node_generation(create_nodes)
{
	if !instance_exists(Node) return;
	
	with (Node)
	{
		node_data = lane_node_data(x, y);
		
		entrance_exit_pos = lane_entrance_exit_gen(x, y, node_data);
		
		for (var i = 0; i < array_length(entrance_exit_pos); i++)
		{
			var xx = entrance_exit_pos[i].lane_node_x_pos;
			var yy = entrance_exit_pos[i].lane_node_y_pos;
			var in = entrance_exit_pos[i].in;
			var out = entrance_exit_pos[i].out;
			var node_x = entrance_exit_pos[i].conn_node_x_pos;
			var node_y = entrance_exit_pos[i].conn_node_y_pos;
			
			if !create_nodes break;
			
			var lane_node = instance_create_depth(xx, yy, 0, Lane_Node);
			
			lane_node.node_pos = [x, y];
			lane_node.conn_node_pos = [node_x, node_y];
			lane_node.in_conn = in;
			lane_node.out_conn = out;
			
			if (out) continue;
			if (get_road_node_type(x, y) == "SPAWNER") continue;
			
			for (var j = 0; j < array_length(entrance_exit_pos); j++)
			{
				var conn_in = entrance_exit_pos[j].in;
				var conn_out = entrance_exit_pos[j].out;
				var conn_node_x = entrance_exit_pos[j].conn_node_x_pos;
				var conn_node_y = entrance_exit_pos[j].conn_node_y_pos;

				if ((in and conn_in) or (out and conn_out)) continue;
				if ((conn_node_x == node_x) and (conn_node_y == node_y)) continue;
				
				var connecting_lane_node = {
					x_pos: precise_round(entrance_exit_pos[j].lane_node_x_pos, 2),
					y_pos: precise_round(entrance_exit_pos[j].lane_node_y_pos, 2)
					}
				
				array_push(lane_node.other_connections, connecting_lane_node);
			}
		}
	}

	if (create_nodes)
	{
		connect_nodes_w_lane_nodes();
		create_LPDG();
	}
}
