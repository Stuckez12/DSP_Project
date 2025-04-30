function scr_format_loaded_data(json_data)
{
	PDG_ROAD_NETWORK = ds_map_create();
	
	for (var i = 0; i < array_length(json_data.user_graph); i++)
	{
		var struct = json_data.user_graph[i];
		
		ds_map_add(PDG_ROAD_NETWORK, struct.key, struct.values);
	}
	
	if (instance_exists(obj_user_node)) with (obj_user_node) instance_destroy(self);
	
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);

	for (var i = 0; i < size; i++)
	{
		var key_data = scr_extract_user_node_key_values(key);
		
		var node = instance_create_layer(int64(key_data.x_pos), int64(key_data.y_pos), "User_Node_Network_Instances", obj_user_node);
	
		node.x_pos = int64(key_data.x_pos);
		node.y_pos = int64(key_data.y_pos);
		node.type = key_data.type;
		
		node.spawner_type = "MODERATE";
		
		try
		{
			for (var j = 0; j < array_length(json_data.user_graph); j++)
			{
				if (json_data.user_graph[i].key == key) { node.spawner_type = json_data.user_graph[i].node_data; break; }
			}
		} catch (e) {}

		node.key = key;
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
}

function ds_map_to_struct_saving()
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	var struct_list = [];

	for (var i = 0; i < size; i++)
	{
		var values = ds_map_find_value(PDG_ROAD_NETWORK, key);
		var node_data = scr_get_user_node_spawner_type(key);
		
		array_push(struct_list, { key: key, values: values, node_data: node_data });
		
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return struct_list;
}
