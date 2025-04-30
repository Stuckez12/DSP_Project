with (Lane_Node) instance_destroy(self);


lane_node_generation(true);


//show_debug_message("No need to worry about decimals that exceed 2dp (2 decimal places)");
//show_debug_message(json_encode(LPDG_LANE_ROAD_NETWORK));


var start_pos = ds_map_find_first(LPDG_LANE_ROAD_NETWORK);
var target_pos = ds_map_find_last(LPDG_LANE_ROAD_NETWORK);

target_pos = ds_map_find_previous(LPDG_LANE_ROAD_NETWORK, target_pos);

//pathing = dijkstra_pathfinding(LPDG_LANE_ROAD_NETWORK, start_pos, target_pos);

