function simulation_mode()
{
	if !keyboard_check_pressed(ord("R")) return;

	if (SIMULATION_ACTIVE)
	{
		interrupt_reset_simulation();
		
		SIMULATION_ACTIVE = false;
		return;
	}
	else SIMULATION_ACTIVE = true;
	
	lane_node_generation(true);
	
	var spawners = count_spawners();
	
	if (spawners < 2)
	{
		show_message("Road network must have two or more spawner nodes in order to run");
		SIMULATION_ACTIVE = false;
		return;
	}
	
	generate_routes_from_spawners();
	
	show_message(array_length(SIMULATION_GENERATED_PATHS));
}

function run_simulation()
{
	if !SIMULATION_ACTIVE return;
	
	var total_paths = array_length(SIMULATION_GENERATED_PATHS);

	if (total_paths == 0) return;
	
	VEHICLE_TIMER ++;
	
	var frame_wait = 30;
	
	if (VEHICLE_TIMER > frame_wait) VEHICLE_TIMER -= frame_wait;
	if (VEHICLE_TIMER != frame_wait) return;
	
	var path_to_take = SIMULATION_GENERATED_PATHS[irandom_range(0, total_paths - 1)];
	
	var start = path_to_take.start;
	
	var xx = start.x_pos;
	var yy = start.y_pos;
	
	var vehicle = instance_create_depth(xx, yy, 100, Vehicle);
	
	array_copy(vehicle.path, 0, path_to_take.route, 0, array_length(path_to_take.route));
	vehicle.next_position = path_to_take.route[0];
	vehicle.destination = path_to_take.finish;
}


function interrupt_reset_simulation()
{
	with (Vehicle) instance_destroy(self);
	
	SIMULATION_GENERATED_PATHS = [];
}






































