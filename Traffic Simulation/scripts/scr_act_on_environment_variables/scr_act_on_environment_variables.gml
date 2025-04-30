function scr_act_on_environment_variables()
{
	var standstill_dist = scr_distance_to_standstill(self.velocity, self.brake_force * 0.8) + self.absolute_min_distance;
	var env_vars = scr_detect_environment_elements(standstill_dist, standstill_dist * 1.3);
	
	if (is_undefined(env_vars[0]) and is_undefined(env_vars[1])) return;

	var has_undefined = array_any(env_vars, function(v) { return is_undefined(v); });
	var element = !is_undefined(env_vars[0]) ? env_vars[0] : env_vars[1];
	
	var imminent_collision;
	var extra_dist = 0;
	
	if !has_undefined
	{
		var blocker_collision = scr_predict_collision_time(self.velocity, env_vars[0].dist, env_vars[0].v_speed);
		var vehicle_collision = scr_predict_collision_time(self.velocity, env_vars[1].dist + 16, env_vars[1].v_speed);

		element = (blocker_collision < vehicle_collision) ? env_vars[0] : env_vars[1];
		imminent_collision = (blocker_collision < vehicle_collision) ? blocker_collision : vehicle_collision;
	}
	else
	{
		var text = element.is_vehicle ? "Vehicle" : "Blocker";
		
		if element.is_vehicle extra_dist = 16;
		
		imminent_collision = scr_predict_collision_time(self.velocity, element.dist, element.v_speed);
	}
	
	if (element.is_vehicle and extra_dist == 0) extra_dist = 16;
	
	var text = imminent_collision.dist < standstill_dist * 1.2 ? "True" : "False";
	
	if ((element.is_vehicle) or (!element.can_pass))
	{
		self.vehicle_movement_state = (imminent_collision.dist < standstill_dist + extra_dist) ? -1 : 0;
	}
}
