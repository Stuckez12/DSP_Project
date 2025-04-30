function dropdown_change_state(x_pos, y_pos, state)
{
	// If no input has been recieved
	if !mouse_check_button_pressed(mb_left) return state;
	
	// Cancel if other dropdown has been selected
	if (state == "compact" and DROPDOWN_SELECTED) return state;
	
	// Calculate bounding box
	var min_x = x_pos + 224;
	var min_y = y_pos;
	
	var max_x = min_x + 32;
	var max_y = min_y + 32;
	
	var gui_mouse_x = device_mouse_x_to_gui(0);
	var gui_mouse_y = device_mouse_y_to_gui(0);

	// Check mouse to dropdown arrow collision box
	if (gui_mouse_x < min_x or gui_mouse_x > max_x) return state;
	if (gui_mouse_y < min_y or gui_mouse_y > max_y) return state;

	if state == "compact"
	{
		DROPDOWN_SELECTED = true;
		depth -= 1000;
		return "dropped"; // State
	}
	
	// Else
	DROPDOWN_SELECTED = false;
	depth += 1000;
	return "compact"; // State
}


function change_selected_dropdown_item(x_pos, y_pos, all_items, current_item)
{
	// If no input has been recieved
	if !mouse_check_button_pressed(mb_left) return current_item;
	
	// Calculate complete collision box
	var item_count = array_length(all_items);
	
	var total_selection_area_height = (item_count) * 32;
	
	var min_x = x_pos;
	var min_y = y_pos;// + total_selection_area_height;
	
	var max_x = min_x + 256;
	var max_y = min_y + total_selection_area_height + 32;
	
	var gui_mouse_x = device_mouse_x_to_gui(0);
	var gui_mouse_y = device_mouse_y_to_gui(0);

	// Get dropdown arrow collision box
	if (gui_mouse_x < min_x or gui_mouse_x > max_x) return current_item;
	if (gui_mouse_y < min_y or gui_mouse_y > max_y) return current_item;
	
	for (var i = 0; i < item_count; i++)
	{
		var at_item_pos = y_pos + ((i + 1) * 32);
		
		if (gui_mouse_x < min_x or gui_mouse_x > max_x) continue;
		if (gui_mouse_y < at_item_pos or gui_mouse_y > at_item_pos + 32) continue;
		
		return all_items[i];
	}
	
	return current_item;
}






























