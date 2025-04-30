function vehicle_velocity(vehicle_movement_state, velocity)
{
	switch(vehicle_movement_state)
	{
		case -1:  //Vehicle Is Braking
			velocity = max(velocity - self.brake_force, 0);
			break;
		
		case 0:  //Vehicle Is Cruising / Stationary
			velocity = max(velocity - self._friction, 0);
			break;
		
		case 1:  // Vehicle Is Accelerating
			var acceleration = 0;

			if (velocity < 1) acceleration = self.acceleration_base + (self.acceleration_factor * velocity);
			else acceleration = self.acceleration_factor * velocity;
			
			acceleration = min(acceleration, self.acceleration_max);
    
		    velocity = min(velocity + acceleration, self.max_speed);
			break;
	}
	
	return velocity;
}
