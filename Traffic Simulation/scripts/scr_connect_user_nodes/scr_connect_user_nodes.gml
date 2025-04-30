function scr_connect_user_nodes(key, connect_both_directions=true)
{
	if scr_do_two_connections_intersect(key, LAST_NODE) return false;
	
	// If the last node doesnt exist, cancel connection
	if !scr_check_last_node_exists() return;
	
	var connecting_node_val = ds_map_find_value(PDG_ROAD_NETWORK, LAST_NODE);
	var new_node_val = ds_map_find_value(PDG_ROAD_NETWORK, key);
	
	var node_key_vals = scr_extract_user_node_key_values(key);
	var last_node_key_vals = scr_extract_user_node_key_values(LAST_NODE);
	
	var new_node_coords =			string(node_key_vals.x_pos) + "|" +			string(node_key_vals.y_pos) +		"|30";
	var connecting_node_coords =	string(last_node_key_vals.x_pos) + "|" +	string(last_node_key_vals.y_pos) +	"|30";


	new_node_val[array_length(new_node_val)] = connecting_node_coords;
	new_node_val = scr_remove_dupe_strings_in_list(new_node_val);

	ds_map_replace(PDG_ROAD_NETWORK, key, new_node_val);
	
	if (connect_both_directions)
	{
		connecting_node_val[array_length(connecting_node_val)] = new_node_coords;
		connecting_node_val = scr_remove_dupe_strings_in_list(connecting_node_val);

		ds_map_replace(PDG_ROAD_NETWORK, LAST_NODE, connecting_node_val);
	}
}
