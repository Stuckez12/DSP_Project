function scr_lane_node_blocker_creation(signalled=false)
{
	var inc_conn = self.incoming_connections;
	var blockers = [];
	
	for (var i = 0; i < array_length(inc_conn); i++)
	{
		var lane_in = inc_conn[i];
		var blocker = instance_create_layer(lane_in.x_pos, lane_in.y_pos, "User_Node_Network_Instances", obj_lane_blocker_node);
		blocker.is_signalled = signalled;

		blocker.dist = lane_in._dist;
		blocker.dir = lane_in._dir;
		
		if (!lane_in.is_joining) blocker.is_main_route = true;
		
		for (var j = 0; j < array_length(self.junction_lane_line_collisions); j++)
		{
			var lane_collision = self.junction_lane_line_collisions[j];
			var lane_key = string_split(lane_collision.lane_path_key, "|");
			
			if (lane_in.x_pos == real(lane_key[0]) and lane_in.y_pos == real(lane_key[1]))
			{
				array_push(blocker.lane_line_collisions, lane_collision);
				
				var struct = {
					key: lane_collision.lane_path_key,
					x_pos: real(lane_key[2]),
					y_pos: real(lane_key[3]),
					can_pass: !signalled
				}
				
				array_push(blocker.can_pass_lane_list, struct);
			}
		}
		
		array_push(blockers, blocker);
	}
	
	return blockers;
}


