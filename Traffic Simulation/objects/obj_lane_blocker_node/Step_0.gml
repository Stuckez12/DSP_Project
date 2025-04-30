if !is_signalled
{
	for (var i = 0; i < array_length(lane_line_collisions); i++)
	{
		var collision_zone = lane_line_collisions[i].collisions;
		var key = lane_line_collisions[i].lane_path_key;
	
		var can_pass = scr_detect_vehicles_in_collision_zone(collision_zone);
	
		for (var j = 0; j < array_length(can_pass_lane_list); j++)
		{
			if (can_pass_lane_list[j].key == key)
			{
				can_pass_lane_list[j].can_pass = !can_pass;
				break;
			}
		}
	}
}
else
{
	var x1 = x + calculate_triangle_base_with_hypotenuse_opp_angle(dist * 0.3, dir);
	var y1 = y + calculate_triangle_opp_with_hypotenuse_opp_angle(dist * 0.3, dir);
	
	var vcl_detected = collision_line(x, y, x1, y1, obj_vehicle, false, true);
	
	if (vcl_detected != noone) and (!self.is_passable_signalled) present_vehicle_timer++;
	else present_vehicle_timer = 0;
}
