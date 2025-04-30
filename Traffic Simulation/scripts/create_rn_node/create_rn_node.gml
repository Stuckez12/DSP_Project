function create_rn_node()
{
	// Check if too close to already created node
	if detect_node() return false;
	
	if !node_network_edge_crossing() return false;

	// Create new node
	var new_node = instance_create_layer(mouse_x, mouse_y, "High_Level_Node_Network", Node);
	new_node.key = { 
		x_pos: mouse_x,
		y_pos: mouse_y,
		junction_type: "REGULAR"
		};

	// Add to graph PDG
	ds_map_add(PDG_ROAD_NETWORK, new_node.key, []);
	
	if (LAST_NODE == undefined) // If not connecting to any road node, end creation
	{
		LAST_NODE = new_node.key;
		return true;
	}
	
	connect_nodes(new_node.key);
	
	// Newly created node now last node
	LAST_NODE = new_node.key;
	
	return true;
}