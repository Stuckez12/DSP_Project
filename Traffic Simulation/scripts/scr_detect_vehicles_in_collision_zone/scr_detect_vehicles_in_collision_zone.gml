function scr_detect_vehicles_in_collision_zone(collision_zone)
{
	for (var i = 0; i < array_length(collision_zone); i++)
	{
		var line = collision_zone[i];
		
		var vehicle_detected = collision_line(line.x1, line.y1, line.x2, line.y2, obj_vehicle, false, true);
		
		//show_debug_message(vehicle_detected != noone);
		
		// TODO add logic to check if the vehicle is going towards the desired destination
		
		if (vehicle_detected != noone) return true;
	}
	
	return false;
}
