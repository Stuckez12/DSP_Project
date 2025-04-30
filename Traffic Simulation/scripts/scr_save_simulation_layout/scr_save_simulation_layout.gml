function scr_save_simulation_layout()
{
	if SIMULATION_ACTIVE return;
	
	var file_types = "JSON Files (*.json)|*.json";
	CURRENT_FILE_PATH = get_save_filename(file_types, CURRENT_FILE_NAME);

	if (string_length(CURRENT_FILE_PATH) != 0)
	{
		CURRENT_FILE_NAME = filename_name(CURRENT_FILE_PATH);
		
		// Format Application Into JSON And Save It
	    var data = {
			user_graph: ds_map_to_struct_saving()
		}

	    var json_string = json_stringify(data);
	    var buffer = buffer_create(string_length(json_string) + 1, buffer_fixed, 1);

	    buffer_write(buffer, buffer_string, json_string);
	    buffer_save(buffer, CURRENT_FILE_PATH);
	    buffer_delete(buffer);

	    show_message("Simulation Saved To " + string(CURRENT_FILE_NAME));
		return;
	}
}

