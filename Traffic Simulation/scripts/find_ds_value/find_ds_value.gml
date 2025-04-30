function find_ds_value(map, struct)
{
	var size = ds_map_size(map);
	var key = ds_map_find_first(map);
	
	//show_debug_message("Current size of previous: " +string(size));
	//show_debug_message("Current previous: " + json_encode(map));

	for (var i = 0; i < size; i++;)
	{
		//show_debug_message("Data Comparisson - struct_x: " + string(struct.x_pos) + " | key.x_pos: " + string(key.x_pos) + " | Equal: " + string(struct.x_pos == key.x_pos) + " | struct_y: " + string(struct.y_pos) + " | key.y_pos: " + string(key.y_pos) + " | Equal: " + string(struct.y_pos == key.y_pos) + " | Value Connected: " + string(ds_map_find_value(map, key)));
		
		//show_debug_message("Key Given:  " + string(struct));
		//show_debug_message("Actual Key: " + string(key));
		
		if (struct == key)
		{
			//show_debug_message("Key Found: " + string(key) + " | Type: " + string(typeof(key)));
			//show_debug_message("Struct:    " + string(struct) + " | Type: " + string(typeof(struct)));
			//show_debug_message("Value Extracted: " + string(ds_map_find_value(map, key)));

			return ds_map_find_value(map, key);
		}
		
		key = ds_map_find_next(map, key);
	}
	
	return undefined;
}