function scr_generate_lane_node_graph(create_nodes=true)
{
	if !instance_exists(obj_user_node) return;
	
	with (obj_user_node)
	{
		node_data = scr_fetch_entrance_exit_lane_nodes_from_user_node(x, y);
		
		entrance_exit_pos = scr_calculate_lane_node_position(x, y, node_data);
		
		for (var i = 0; i < array_length(entrance_exit_pos); i++)
		{
			var xx = entrance_exit_pos[i].lane_node_x_pos;
			var yy = entrance_exit_pos[i].lane_node_y_pos;
			var in = entrance_exit_pos[i].in;
			var out = entrance_exit_pos[i].out;
			var node_x = entrance_exit_pos[i].conn_node_x_pos;
			var node_y = entrance_exit_pos[i].conn_node_y_pos;
			var _speed = entrance_exit_pos[i].speed_limit;
			var order = entrance_exit_pos[i].order;
			
			if !create_nodes break;
			
			var lane_node = instance_create_layer(xx, yy, "User_Node_Network_Instances", obj_lane_node);
	
			lane_node.node_pos = [x, y];
			lane_node.conn_node_pos = [node_x, node_y];
			lane_node.in_conn = in;
			lane_node.out_conn = out;
			lane_node.connecting_node = false;
			lane_node.connecting_node_generated = false;
			lane_node.speed_limit = _speed;
			lane_node.lane_node_pos = [xx, yy];
			lane_node.junction_order = order;

			if (out) continue;
			if (scr_get_user_node_type(x, y) == "SPAWNER") continue;
			
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
					
				var lane_node_key = scr_create_lane_node_connection_key_from_struct(connecting_lane_node);
				
				array_push(lane_node.other_connections, lane_node_key);
			}
		}
	}

	if (create_nodes)
	{
		scr_connect_user_and_lane_nodes();
		scr_create_lane_graph();
	}
}
