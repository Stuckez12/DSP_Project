function node_network_edge_crossing()
{
	if (LAST_NODE != undefined)
	{
		var is_intersecting = check_all_graph_connections_to_(mouse_x, mouse_y, LAST_NODE.x_pos, LAST_NODE.y_pos);
	
		if is_intersecting.result
		{
			global.error_create_edge_x = is_intersecting.x_pos;
			global.error_create_edge_y = is_intersecting.y_pos;
			global.error_create_edge_timer = 100;
			global.error_create_edge_message = "Connections between nodes cannot cross!";
		
			return false;
		}
	}
	return true;
}


function node_network_creating_too_close()
{
	global.error_create_edge_x = mouse_x;
	global.error_create_edge_y = mouse_y;
	global.error_create_edge_timer = 100;
	global.error_create_edge_message = "Nodes cannot be placed within close proximity!";
}