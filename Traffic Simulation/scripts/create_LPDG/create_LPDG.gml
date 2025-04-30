function create_LPDG()
{
	ds_map_destroy(LPDG_LANE_ROAD_NETWORK);
	LPDG_LANE_ROAD_NETWORK = ds_map_create();

	with (Lane_Node)
	{
		var key = {
			x_pos: precise_round(x, 2),
			y_pos: precise_round(y, 2)
			}
		
		ds_map_add(LPDG_LANE_ROAD_NETWORK, key, other_connections);
	}
}

