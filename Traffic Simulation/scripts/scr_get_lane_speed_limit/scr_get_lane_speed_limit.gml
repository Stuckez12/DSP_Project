function scr_get_lane_speed_limit(key)
{
	var key_data = scr_extract_lane_connection_key_values(key);
	
	with (obj_lane_node)
	{
		if (self.lane_node_pos[0] == key_data.x_pos) and (self.lane_node_pos[1] == key_data.y_pos) return self.speed_limit / 10;
	}
	
	return 0;
}
