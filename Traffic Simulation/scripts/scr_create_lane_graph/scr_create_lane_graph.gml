function scr_create_lane_graph()
{
	ds_map_destroy(LPDG_LANE_ROAD_NETWORK);
	LPDG_LANE_ROAD_NETWORK = ds_map_create();

	with (obj_lane_node)
	{
		var key = string(lane_node_pos[0]) + "|" + string(lane_node_pos[1]);
		
		ds_map_add(LPDG_LANE_ROAD_NETWORK, key, other_connections);
	}
}
