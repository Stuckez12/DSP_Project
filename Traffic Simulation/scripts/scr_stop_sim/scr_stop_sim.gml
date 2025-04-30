function scr_stop_sim()
{
	SIMULATION_ACTIVE = false;
	SIMULATION_RUNNING = false;
	SIMULATION_GENERATED_PATHS = [];
	
	with (obj_vehicle) instance_destroy(self);
	with (obj_lane_node) instance_destroy(self);
	with (obj_junction_controller) instance_destroy(self);
	with (obj_lane_blocker_node) instance_destroy(self);
	with (obj_vehicle_spawner) instance_destroy(self);
}