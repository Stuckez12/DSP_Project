function scr_provide_movement_data(pos, next_pos)
{
	if (pos == next_pos) return;
	
	var key_data = scr_extract_lane_connection_key_values(pos);
	var lane_node = noone;
	
	with (obj_lane_node) { if (self.lane_node_pos[0] == key_data.x_pos) and (self.lane_node_pos[1] == key_data.y_pos) { lane_node = self.id; break; } }
	
	if lane_node == noone return;
	
	var time_passed = current_time - self.last_point_time;
	self.last_point_time = current_time;
	
	var next_key_data = scr_extract_lane_connection_key_values(pos);
	
	var dist = pythagorus(key_data.x_pos, key_data.y_pos, next_key_data.x_pos, next_key_data.y_pos);
	var lane_speed = scr_get_lane_speed_limit(pos);
	
	var struct = {
		to: next_pos,
		time_passed: time_passed
	}
	
	array_push(lane_node.pass_through_data, struct);
}
