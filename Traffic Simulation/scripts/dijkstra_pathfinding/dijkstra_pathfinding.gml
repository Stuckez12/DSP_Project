function dijkstra_pathfinding(graph_map, start_pos, target_pos)
{
    var priority_queue = ds_priority_create();
    ds_priority_add(priority_queue, pos_to_key(start_pos), 0);
    var costs = ds_map_create();
    ds_map_add(costs, pos_to_key(start_pos), 0);
    var previous = ds_map_create();
	
	while (!ds_priority_empty(priority_queue))
	{
        var current_key = ds_priority_delete_min(priority_queue);
        var current_cost = ds_map_find_value(costs, current_key);

        if (current_key == target_pos) break;
        var neighbors = find_ds_value(graph_map, current_key);
        var neighbor_count = array_length(neighbors);
		
		for (var i = 0; i < neighbor_count; i++)
		{
            var neighbor = neighbors[i];
            var neighbor_key = neighbor;
            var new_cost = current_cost + 1;

            if (!ds_map_exists(costs, neighbor_key) or new_cost < ds_map_find_value(costs, neighbor_key))
			{
                ds_map_replace(costs, neighbor_key, new_cost);
                ds_priority_add(priority_queue, neighbor_key, new_cost);
                ds_map_replace(previous, neighbor_key, current_key);
            }
        }
    }

    var path = [];
    var current = pos_to_key(target_pos);

    if (ds_map_exists(previous, current))
	{
        while (current != pos_to_key(start_pos))
		{
            array_push(path, key_to_pos(current));
            current = ds_map_find_value(previous, current);
        }

        array_push(path, start_pos);
        path = array_reverse(path);
    }

    ds_priority_destroy(priority_queue);
    ds_map_destroy(costs);
    ds_map_destroy(previous);

    return path;
}



function convert_graph_keys(original_map)
{
    var size = ds_map_size(original_map);
	var key = ds_map_find_first(original_map);
	
	var new_map = ds_map_create();
	
	for (var i = 0; i < size; i++;)
	{
		var new_key = pos_to_key(key);
		var old_values = ds_map_find_value(original_map, key);
		
		var new_values = [];
		
		for (var j = 0; j < array_length(old_values); j++)
		{
			var value = pos_to_key(old_values[j]);
			
			array_push(new_values, value);
		}

		ds_map_add(new_map, new_key, new_values)

		key = ds_map_find_next(LPDG_LANE_ROAD_NETWORK, key);
	}

	LPDG_LANE_ROAD_NETWORK = new_map;
}


function pos_to_key(pos)
{
	return string(pos.x_pos) + "," + string(pos.y_pos);
}

function key_to_pos(key)
{
	var parts = string_split(key, ",");
	return { x_pos: real(parts[0]), y_pos: real(parts[1]) };
}