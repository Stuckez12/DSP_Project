function scr_initialise_junction_nodes()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size; i++)
	{
		with (obj_user_node)
		{
			if (self.key != key) continue;

			var connection_count = array_length(self.node_data);
			if (connection_count < 3) break;

			var x1 = self.x_pos;
			var y1 = self.y_pos;

			var junction_controller = instance_create_layer(x1, y1, "User_Node_Network_Instances", obj_junction_controller);

			junction_controller.user_node_key = key;

			with (obj_lane_node)
			{
				var x2 = self.node_pos[0];
				var y2 = self.node_pos[1];

				if (x1 != x2) or (y1 != y2) continue;

				var x3 = self.conn_node_pos[0];
				var y3 = self.conn_node_pos[1];

				var angle = calculate_point_angle(x1, y1, x3, y3);
				var distance = pythagorus(x1, y1, x3, y3);

				var struct = {
					x_pos: self.lane_node_pos[0],
					y_pos: self.lane_node_pos[1],
					user_conn_x_pos: x3,
					user_conn_y_pos: y3,
					_dir: angle,
					_dist: distance,
					_speed: self.speed_limit,
					is_joining: true,
					lane_conns: self.other_connections
				}

				if self.in_conn array_push(junction_controller.incoming_connections, struct);
				else if self.out_conn array_push(junction_controller.outgoing_connections, struct);
			}

			scr_assign_main_road_connections(junction_controller);
			
			scr_assign_user_conn_nodes(junction_controller);
		}

		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
}
