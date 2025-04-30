gui_height = 128;

// Total number of buttons to draw = column * row
button_column_count = 16;
button_row_count = 2;

//Button size
button_width = 64;
button_height = 64;

gui_button_width = 48 / button_width;
gui_button_height = 48 / button_height;

//Button spacing from gui border
gui_border_width = 64;
gui_border_height = 8;

//Between buttons spacing 
button_width_spacing = ((browser_width - (gui_border_width * 2)) / button_column_count) - gui_button_width;
button_height_spacing = ((gui_height - (gui_border_height * 2)) / button_row_count) - gui_button_height;

button_actions = [
	[0, 0, s_crud_user_network, 0, scr_unn_change_mode_to_create, "Build Mode: Create"],
	[1, 0, s_crud_user_network, 1, scr_unn_change_mode_to_edit, "Build Mode: Edit"],
	[2, 0, s_crud_user_network, 2, scr_unn_change_mode_to_delete, "Build Mode: Delete"],
	[3, 0, s_save_load, 1, scr_save_simulation_layout, "Save Simulation"],
	[4, 0, s_save_load, 0, scr_load_simulation_layout, "Load Simulation"],
	
	
	
	[15, 0, s_exit_button, 0, game_end, "Exit Application"],
	
	// #===------------------------- next row -------------------------===#
	
	[0, 1, s_run_simulation, 0, scr_stop_sim, "Terminate Simulation"],
	[1, 1, s_run_simulation, 1, scr_activate_sim, "Start Simulation"],
	[2, 1, s_run_simulation, 2, scr_pause_sim, "Pause Simulation"],
	[3, 1, s_clear_env, 0, scr_clear_env, "Delete User Network"],
	[4, 1, s_road_visual, 0, scr_toggle_visuals, "Toggle Visual Mode"],
	
	
	
	[15, 1, s_application_window, IS_APP_WINDOWED, scr_window_application, "Fullscreen Application"],
];

all_button_positions = [];

//Calculate all positions of buttons
for (var xx = 0; xx < button_column_count; xx++)
{
	for (var yy = 0; yy < button_row_count; yy++)
	{
		var x_pos = gui_border_width + (button_width_spacing * xx) + (gui_button_width * xx);
		var y_pos = gui_border_height + (button_height_spacing * yy) + (gui_button_height * yy);
		
		var button_data = {
			button_x: xx,
			button_y: yy,
			pos_x: x_pos,
			pos_y: y_pos
		}

		array_push(all_button_positions, button_data);
	}
}









































