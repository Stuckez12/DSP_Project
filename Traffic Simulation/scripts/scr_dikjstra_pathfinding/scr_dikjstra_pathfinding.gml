function scr_dijkstra_pathfinding(graph_map, start_pos, target_pos)
{
    // Priority queue: ds_priority
    var priority_queue = ds_priority_create();
    ds_priority_add(priority_queue, start_pos, 0);

    // Cost and previous maps
    var costs = ds_map_create();
    ds_map_add(costs, start_pos, 0);

    var previous = ds_map_create();
	
	while (!ds_priority_empty(priority_queue)) {
        // Get the node with the lowest cost
        var current_key = ds_priority_delete_min(priority_queue);
        var current_cost = ds_map_find_value(costs, current_key);

        // Check if we've reached the target
        if (current_key == target_pos) break;

        // Get neighbors for the current position
        var neighbors = find_ds_value(graph_map, current_key);
        var neighbor_count = array_length(neighbors);

        for (var i = 0; i < neighbor_count; i++) {
            var neighbor_key = neighbors[i];
            var new_cost = current_cost + (130 - scr_get_lane_speed_limit(neighbor_key)); // Change to accomodate speed
			
			//show_debug_message("Neighbour Key: " + string(neighbor_key));

            // If the neighbor is not visited or the new cost is lower
            if (!ds_map_exists(costs, neighbor_key) or new_cost < ds_map_find_value(costs, neighbor_key)) {
                ds_map_replace(costs, neighbor_key, new_cost);
                ds_priority_add(priority_queue, neighbor_key, new_cost);
                ds_map_replace(previous, neighbor_key, current_key);
            }
        }
    }

    // Reconstruct the path
    var path = [];
    var current = target_pos;

    if (ds_map_exists(previous, current)) {
        while (current != start_pos) {
            array_push(path,current);
            current = ds_map_find_value(previous, current);
        }
        array_push(path, start_pos); // Add the start position
        path = array_reverse(path); // Reverse the path to get it in the correct order
    }

    // Cleanup
    ds_priority_destroy(priority_queue);
    ds_map_destroy(costs);
    ds_map_destroy(previous);
	
	//show_debug_message(path);

    return path;
}
