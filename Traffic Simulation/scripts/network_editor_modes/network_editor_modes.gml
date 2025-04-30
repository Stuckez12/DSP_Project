function change_network_editor_mode()
{
	if WAITING_FOR_INPUT return;
	if SIMULATION_ACTIVE return;
	
	if keyboard_check_pressed(ord("E"))
	{
		if (ROAD_EDIT_MODE == "CREATE") ROAD_EDIT_MODE = "EDIT";
		else if (ROAD_EDIT_MODE == "EDIT") ROAD_EDIT_MODE = "DELETE";
		else if (ROAD_EDIT_MODE == "DELETE") ROAD_EDIT_MODE = "CREATE";
		
		show_message("Network Editor Mode: " + ROAD_EDIT_MODE);
	}
}

function network_editor_modes()
{
	if SIMULATION_ACTIVE return;
	
	switch (ROAD_EDIT_MODE)
	{
		case "CREATE":
			create_network();
			break;
			
		case "EDIT":
			edit_network();
			break;
			
		case "DELETE":
			delete_network();
			break;
	}
}

function create_network()
{
	if mouse_check_button_pressed(mb_left)
	{
		if detect_node()
		{
			if LAST_NODE == undefined
			{
				detect_node(true);
			}
			else
			{
				if !node_network_edge_crossing() return false;
				
				var key = detect_node(false, true);
				
				if (key != false)
				{
					connect_nodes(key);
			
					LAST_NODE = key;
				}
				else node_network_creating_too_close();
			}
		}
		else create_rn_node();
	}

	if mouse_check_button_pressed(mb_right)
	{
		LAST_NODE = undefined;
	}	
}

function edit_network()
{
	if mouse_check_button_released(mb_left) and !WAITING_FOR_INPUT
	{
		var nearest_node = instance_nearest(mouse_x, mouse_y, Node);
		var distance = pythagorus(mouse_x, mouse_y, nearest_node.x, nearest_node.y);
		
		if distance <= 64
		{
			ROAD_LINE_SELECTED = [nearest_node.x, nearest_node.y];
			WAITING_FOR_INPUT = true;
			
			ROAD_TYPE_SELECTED = get_road_node_type(nearest_node.x, nearest_node.y);
			
			return;
		}

		// Get closest line to mouse
		var closest_line = find_closest_connection_from_mouse();
		if (array_length(closest_line) == 0) return;
		
		// Unpack list
		var x1 = closest_line[0];
		var y1 = closest_line[1];
		var x2 = closest_line[2];
		var y2 = closest_line[3];
		
		// Check if closest line is within bounds
		if (!is_point_near_line(mouse_x, mouse_y, x1, y1, x2, y2, 32)) return;

		ROAD_LINE_SELECTED = [x1, y1, x2, y2];
		WAITING_FOR_INPUT = true;
		ROAD_SPEED_SELECTED = get_road_speed_from_line_coords(x1, y1, x2, y2);
	}
	else if WAITING_FOR_INPUT and array_length(ROAD_LINE_SELECTED) == 4
	{
		if !instance_exists(edit_road_popup)
		{
			instance_create_layer(x, y, "GUI", edit_road_popup);
		}
	}
	else if WAITING_FOR_INPUT and array_length(ROAD_LINE_SELECTED) == 2
	{
		if !instance_exists(edit_road_node_popup)
		{
			instance_create_layer(x, y, "GUI", edit_road_node_popup);
		}
	}
}

function delete_network()
{
	if !instance_exists(Node) return;
	
	if mouse_check_button(mb_left)
	{
		var nearest_node = instance_nearest(mouse_x, mouse_y, Node);
		var distance = pythagorus(mouse_x, mouse_y, nearest_node.x, nearest_node.y);
		
		if distance <= 64
		{
			delete_network_node(nearest_node.x, nearest_node.y, nearest_node);

			return;
		}

		// Get closest line to mouse
		var closest_line = find_closest_connection_from_mouse();
		if (array_length(closest_line) == 0) return;
		
		// Unpack list
		var x1 = closest_line[0];
		var y1 = closest_line[1];
		var x2 = closest_line[2];
		var y2 = closest_line[3];
		
		// Check if closest line is within bounds
		if (!is_point_near_line(mouse_x, mouse_y, x1, y1, x2, y2, 32)) return;

		delete_network_connection(x1, y1, x2, y2);
	}
}


































