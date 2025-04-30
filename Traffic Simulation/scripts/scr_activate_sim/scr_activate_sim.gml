function scr_activate_sim()
{
	if SIMULATION_ACTIVE
	{
		if (!SIMULATION_RUNNING) SIMULATION_RUNNING = true;
		return;
	}
	
	var spawners = scr_count_spawners();
	
	if (spawners < 2)
	{
		show_message("Road network must have two or more spawner nodes in order to run");
		return;
	}
	
	SIMULATION_ACTIVE = true;
	SIMULATION_RUNNING = true;
	SIMULATION_GENERATED_PATHS = [];
	
	scr_generate_lane_node_graph(true);
	
	scr_initialise_junction_nodes();
	
	scr_generate_vehicle_routes();
	
	scr_place_vehicle_spawners();
}
