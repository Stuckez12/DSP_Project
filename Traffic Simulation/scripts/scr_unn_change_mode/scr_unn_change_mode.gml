function scr_unn_change_mode_to_create()
{
	if SIMULATION_ACTIVE return;
	
	ROAD_EDIT_MODE = "CREATE";
}

function scr_unn_change_mode_to_edit()
{
	if SIMULATION_ACTIVE return;
	
	ROAD_EDIT_MODE = "EDIT";
}

function scr_unn_change_mode_to_delete()
{
	if SIMULATION_ACTIVE return;
	
	ROAD_EDIT_MODE = "DELETE";
}
