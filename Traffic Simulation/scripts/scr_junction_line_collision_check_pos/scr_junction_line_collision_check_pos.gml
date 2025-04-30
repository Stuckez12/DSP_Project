function scr_junction_line_collision_check_pos()
{
	var inc_conn = self.incoming_connections;
	var out_conn = self.outgoing_connections;

	var all_conn = self.all_connections;
	var main_conn = self.main_connections;
	
	self.junction_lane_line_collisions = [];
	
	for (var i = 0; i < array_length(all_conn); i++)
	{
		var x1 = all_conn[i].x_pos;
		var y1 = all_conn[i].y_pos;
		
		var lane_in = scr_user_conn_has_lane_node(x1, y1, inc_conn);
		if (lane_in == -1) continue;
		
		for (var j = 0; j < array_length(all_conn); j++)
		{
			var x2 = all_conn[j].x_pos;
			var y2 = all_conn[j].y_pos;
		
			if (x1 == x2) and (y1 == y2) continue;
			
			var lane_out = scr_user_conn_has_lane_node(x2, y2, out_conn);
			if (lane_out == -1) continue;
			
			// now we have got the positions of both the in and out junction lane nodes
			
			var lane_conn_key = string(lane_in.x_pos) + "|" + string(lane_in.y_pos) + "|" + string(lane_out.x_pos) + "|" + string(lane_out.y_pos);
			
			if (scr_lane_key_already_used(lane_conn_key)) continue;

			var line_colls = scr_get_dependant_lane_collisions([lane_in, lane_out], inc_conn, out_conn);
			
			var struct = {
				lane_path_key: lane_conn_key,
				collisions: line_colls
			}

			array_push(self.junction_lane_line_collisions, struct);
		}
	}
}

function scr_user_conn_has_lane_node(x1, y1, conn_list)
{
	for (var i = 0; i < array_length(conn_list); i++)
	{
		var lane_node = conn_list[i];
		
		if (lane_node.user_conn_x_pos == x1) and (lane_node.user_conn_y_pos == y1) return conn_list[i];
	}
	
	return -1;
}

function scr_lane_key_already_used(key)
{
	var list = self.junction_lane_line_collisions;
	
	for (var i = 0; i < array_length(list); i++)
	{
		var element = list[i];
		
		if (element.lane_path_key == key) return true;
	}
	
	return false;
}
