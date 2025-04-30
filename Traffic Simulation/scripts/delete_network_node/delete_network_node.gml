function delete_network_node(x1, y1, inst)
{
	instance_destroy(inst);
	
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	for (var i = 0; i < size; i++;)
	{
		if (x1 != key.x_pos or y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}

		key = ds_map_delete(PDG_ROAD_NETWORK, key);
		break;
	}
	
	size = ds_map_size(PDG_ROAD_NETWORK);
	key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++;)
	{
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			var structure = connections[j];

			if (x1 == structure.x_pos and y1 == structure.y_pos)
			{
				array_delete(connections, structure, 1);
				break;
			}
		}
		
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
}

function delete_network_connection(x1, y1, x2, y2)
{
	remove_connection(x1, y1, x2, y2);
	remove_connection(x2, y2, x1, y1);
}


function remove_connection(x1, y1, x2, y2)
{
	var size = ds_map_size(PDG_ROAD_NETWORK);
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	
	for (var i = 0; i < size; i++)
	{
		if (x1 != key.x_pos or y1 != key.y_pos)
		{
			key = ds_map_find_next(PDG_ROAD_NETWORK, key);
			continue;
		}
		
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);
		var found = false;

		for (var j = 0; j < array_length(connections); j++)
		{
			var structure = connections[j];

			if (x2 == structure.x_pos and y2 == structure.y_pos)
			{
				array_delete(connections, structure, 1);
				found = true;
				ds_map_replace(PDG_ROAD_NETWORK, key, connections);
				break;
			}
		}
		
		if found break;
		
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
}





































