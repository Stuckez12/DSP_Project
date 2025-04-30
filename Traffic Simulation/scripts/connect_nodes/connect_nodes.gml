function connect_nodes(node_key, connect_both_directions=true)
{
	var connecting_node_val = ds_map_find_value(PDG_ROAD_NETWORK, LAST_NODE);
	var new_node_val = ds_map_find_value(PDG_ROAD_NETWORK, node_key);

	var new_node_coords = {
		x_pos: node_key.x_pos,
		y_pos: node_key.y_pos,
		speed_limit: 30
		};
		
	var connecting_node_coords = {
		x_pos: LAST_NODE.x_pos,
		y_pos: LAST_NODE.y_pos,
		speed_limit: 30
		};
	
	if (connect_both_directions) connecting_node_val[array_length(connecting_node_val)] = new_node_coords;
	new_node_val[array_length(new_node_val)] = connecting_node_coords;
	
	connecting_node_val = remove_list_struct_duplicates(connecting_node_val, struct_PDG_connection);
	new_node_val = remove_list_struct_duplicates(new_node_val, struct_PDG_connection);
	
	ds_map_replace(PDG_ROAD_NETWORK, LAST_NODE, connecting_node_val);
	ds_map_replace(PDG_ROAD_NETWORK, node_key, new_node_val);
}