function scr_load_simulation_layout()
{
	if SIMULATION_ACTIVE return;
	
	var file_types = "JSON Files (*.json)|*.json";
	CURRENT_FILE_PATH = get_open_filename(file_types, CURRENT_FILE_NAME);

	if (string_length(CURRENT_FILE_PATH) == 0) { show_message("Simulation Path Not Provided"); return; }

	CURRENT_FILE_NAME = filename_name(CURRENT_FILE_PATH);
		
	if (!file_exists(CURRENT_FILE_PATH)) { show_message("Simulation Not Found"); return; }
	
	var buffer = buffer_load(CURRENT_FILE_PATH);
	var json_string = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);

	var data;
	
	// Parse the data into a readable format
	try { data = json_parse(json_string); }
	catch (e) { show_message("JSON Parse Failed. Simulation Not Loaded"); return; }
	
	// Format the data ready for simulation testing
	try { scr_format_loaded_data(data); }
	catch (e) { show_message("JSON File Corrupted Or Incorrectly Formatted. Simulation Not Loaded"); return; }

	show_message(CURRENT_FILE_NAME + " Simulation File Loaded");
}

