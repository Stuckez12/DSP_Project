function scr_user_node_network_control()
{
	if SIMULATION_ACTIVE return;
	
	if ROAD_EDIT_MODE == "CREATE" scr_user_nnc_create();
	else if ROAD_EDIT_MODE == "EDIT" scr_user_nnc_edit();
	else if ROAD_EDIT_MODE == "DELETE" scr_user_nnc_delete();
}

function scr_user_nnc_create()
{
	if SIMULATION_ACTIVE return;
	
	if mouse_check_button_pressed(mb_right) LAST_NODE = undefined;
	if !mouse_check_button_pressed(mb_left) exit;
	
	var nearest_node = noone;
	var distance = 256;
	
	if instance_exists(obj_user_node)
	{
		nearest_node = instance_nearest(mouse_x, mouse_y, obj_user_node);
		distance = pythagorus(mouse_x, mouse_y, nearest_node.x, nearest_node.y);
	}
	else
	{
		scr_create_user_node(mouse_x, mouse_y);
		return;
	}
	
	if LAST_NODE == undefined
	{
		// Set node nearest to mouse as the last node if no node has been set as last
		if (distance < 128) LAST_NODE = nearest_node.key;
		else scr_create_user_node(mouse_x, mouse_y);
	}
	else
	{
		// connect the two nodes between last node and nearest node if last node is not undefined
		if (distance < 128)
		{
			scr_connect_user_nodes(nearest_node.key);
			LAST_NODE = nearest_node.key;
		}
		else scr_create_user_node(mouse_x, mouse_y);
	}
}

function scr_user_nnc_edit()
{
	if SIMULATION_ACTIVE return;
	if WAITING_FOR_INPUT return;
	
	if (mouse_check_button_pressed(mb_left)) // Edit node
	{
		if !instance_exists(obj_user_node) return;
		
		var nearest_node = instance_nearest(mouse_x, mouse_y, obj_user_node);
		var distance = pythagorus(mouse_x, mouse_y, nearest_node.x, nearest_node.y);
		
		if distance <= 64
		{
			ROAD_LINE_SELECTED = [nearest_node.x, nearest_node.y];
			WAITING_FOR_INPUT = true;
			
			ROAD_TYPE_SELECTED = scr_get_user_node_type(nearest_node.x, nearest_node.y);
			ROAD_SPAWNER_TYPE_SELECTED = scr_get_user_node_spawner_type(nearest_node.key);
			
			scr_create_user_node_popup();
			return;
		}
	}
	else if (mouse_check_button_pressed(mb_right)) // Edit Connection
	{
		var closest_line = scr_get_nearest_connection_from_position(mouse_x, mouse_y);
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
		ROAD_SPEED_SELECTED = scr_get_connection_speed_limit(x1, y1, x2, y2);
		
		scr_create_user_node_connection_popup();
		
		return;
	}
}

function scr_user_nnc_delete()
{
	if SIMULATION_ACTIVE return;
	
	if (mouse_check_button_pressed(mb_left)) // Delete node
	{
		if !instance_exists(obj_user_node) return;
		
		var nearest_node = instance_nearest(mouse_x, mouse_y, obj_user_node);
		var distance = pythagorus(mouse_x, mouse_y, nearest_node.x, nearest_node.y);
		
		if distance <= 64
		{
			scr_delete_user_node(nearest_node.x, nearest_node.y, nearest_node);
			return;
		}
	}
	else if (mouse_check_button_pressed(mb_right)) // Delete Connection
	{
		var closest_line = scr_get_nearest_connection_from_position(mouse_x, mouse_y);
		if (array_length(closest_line) == 0) return;
		
		// Unpack list
		var x1 = closest_line[0];
		var y1 = closest_line[1];
		var x2 = closest_line[2];
		var y2 = closest_line[3];
		
		// Check if closest line is within bounds
		if (!is_point_near_line(mouse_x, mouse_y, x1, y1, x2, y2, 32)) return;

		scr_delete_user_node_connection(x1, y1, x2, y2);
		
		return;
	}
}
