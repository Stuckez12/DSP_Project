function scr_vehicle_decision_speed(_velocity, road_speed)
{
	if (_velocity > road_speed + 3) // going way faster than road speed limit
	{
		self.vehicle_movement_state = -1;
	}
	else if (_velocity > road_speed) // going faster than road speed limit
	{
		self.vehicle_movement_state = 0;
	}
	else if (_velocity == road_speed) // going the road speed limit
	{
		self.vehicle_movement_state = max(0, self.vehicle_movement_state);
	}
	else // going slower than road speed limit
	{
		self.vehicle_movement_state = 1;
	}
}
