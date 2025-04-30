function scr_create_user_node(x_pos, y_pos)
{
	x_pos = precise_round(x_pos, 2);
	y_pos = precise_round(y_pos, 2);
	
	var key = string(x_pos) + "|" + string(y_pos) + "|REGULAR";
	
	if (LAST_NODE != undefined) // If not connecting to any road node, end creation
	{
		if scr_do_two_connections_intersect(key, LAST_NODE) return false;
	}
	
	//create new node
	var node = instance_create_layer(x_pos, y_pos, "User_Node_Network_Instances", obj_user_node);
	
	node.x_pos = x_pos;
	node.y_pos = y_pos;
	node.type = "REGULAR";
	
	node.key = key;

	// Add to graph PDG
	ds_map_add(PDG_ROAD_NETWORK, key, []);
	
	if (LAST_NODE == undefined) // If not connecting to any road node, end creation
	{
		LAST_NODE = key;
		return true;
	}
	
	scr_connect_user_nodes(key);
	
	// Newly created node now last node
	LAST_NODE = key;
	
	return true;
}
