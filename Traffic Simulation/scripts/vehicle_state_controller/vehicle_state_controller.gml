function vehicle_state_controller(vehicle_data, vehicle_detection, road_data)
{
	var new_accel_state = 0;
	var new_new_object_state = 0;
	
	var accel_state = vehicle_data.accel_state;
	var object_state = vehicle_data.object_state; 
	
	var current_velocity = vehicle_data.current_velocity;
	var min_accel_dist = vehicle_data.min_accel_dist;
	var min_brake_dist = vehicle_data.min_brake_dist;
	var signal_pos = vehicle_data.signal_pos;
	
	
	
	
	
	var speed_limit = road_data.speed_limit;
	
	
	
	
	
	
	switch (accel_state)
	{
		case -1:  //Vehicle Is Braking
			if !vehicle_detection.coll and 
			{
				
			}
			
			
			
			
			
			break;
		
		case 0:  //Vehicle Is Cruising / Stationary
			
			
			
			
			
			
			
			break;
		
		case 1:  // Vehicle Is Accelerating
			
			
			
			
			
			break;
	}
	
	return { accel : new_accel_state, obj : undefined }
}



































