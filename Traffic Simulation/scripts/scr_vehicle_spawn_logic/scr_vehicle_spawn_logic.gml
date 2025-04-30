function scr_vehicle_spawn_logic()
{
	VEHICLE_TIMER ++;
	
	var quit = false;
	
	//if (instance_exists(obj_vehicle)) with (obj_vehicle) if self.functioning or true { quit = true; break; }
	
	if quit return;
	
	var frame_wait = 60;
	
	if (VEHICLE_TIMER > frame_wait) VEHICLE_TIMER = 0;
	
	var total_paths = array_length(SIMULATION_GENERATED_PATHS);
	
	var path_to_take = SIMULATION_GENERATED_PATHS[irandom_range(0, total_paths - 1)];
	
	var start = path_to_take.start;
	
	var xx = start.x_pos;
	var yy = start.y_pos;
	
	var next_pos = path_to_take.route[1];
	
	var next_key = scr_extract_lane_connection_key_values(next_pos);
	
	var next_x = next_key.x_pos;
	var next_y = next_key.y_pos;
	
	var speed_limit = scr_get_lane_speed_limit(string(xx) + "|" + string(yy));

	var dist = point_distance(xx, yy, next_x, next_y);
	var checking_dist = min(speed_limit * 32, dist);
		
	var dir = true_point_direction(xx, yy, next_x, next_y);
	
	var x_dist = xx + calculate_triangle_base_with_hypotenuse_opp_angle(checking_dist, dir);
	var y_dist = yy + calculate_triangle_opp_with_hypotenuse_opp_angle(checking_dist, dir);
		
	var detect = collision_line(xx, yy, x_dist, y_dist, obj_vehicle, false, true);
		
	if (detect != noone) return;
	
	if (VEHICLE_TIMER != 0) return;
	
	var vehicle = instance_create_layer(xx, yy, "Vehicles", obj_vehicle);
	
	array_copy(vehicle.path, 0, path_to_take.route, 0, array_length(path_to_take.route));
	vehicle.next_position = path_to_take.route[0];
	vehicle.last_position = path_to_take.route[0];
	vehicle.destination = path_to_take.finish;
	vehicle.velocity = speed_limit;
}
