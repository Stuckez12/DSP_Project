function scr_clear_env()
{
	if SIMULATION_ACTIVE return;
	
	if !show_question("Are you sure you want to delete the current road network?") return;

	PDG_ROAD_NETWORK = ds_map_create();
	if (instance_exists(obj_user_node)) with (obj_user_node) instance_destroy(self);
}
