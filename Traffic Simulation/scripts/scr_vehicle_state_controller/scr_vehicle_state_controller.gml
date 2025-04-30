function scr_vehicle_state_controller(speed_limit, _velocity)
{
	scr_vehicle_decision_speed(_velocity, speed_limit);
					
	scr_act_on_environment_variables();
}
