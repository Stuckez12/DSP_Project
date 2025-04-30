function scr_update_user_node_type(key, new_type, new_spawner_type)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key_search = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size; i++;)
	{
		// Get user node
		if (key_search != key)
		{
			key_search = ds_map_find_next(PDG_ROAD_NETWORK, key_search);
			continue;
		}
		
		// Get key as struct
		var key_data = scr_extract_user_node_key_values(key);
		
		// Update type
		key_data.type = new_type;
		
		//Remove existing key and replace with new key
		var value = ds_map_find_value(PDG_ROAD_NETWORK, key);
		ds_map_delete(PDG_ROAD_NETWORK, key);
		
		var new_key = scr_create_user_node_key_from_struct(key_data);

		ds_map_add(PDG_ROAD_NETWORK, new_key, value);
		
		with (obj_user_node)
		{
			if (self.key != key) continue;
			
			self.key = new_key;
			self.type = new_type;
			self.spawner_type = new_spawner_type;
			
			break;
		}
		
		break;
	}
}
