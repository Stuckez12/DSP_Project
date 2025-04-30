function scr_get_lane_node_order(x1, y1)
{
	with (obj_lane_node) if (self.lane_node_pos[0] == x1) and (self.lane_node_pos[1] == y1) return self.junction_order;
	
	return 0;
}

function scr_get_node_order_limit(x1, y1)
{
	with (obj_user_node) if (x_pos == x1) and (y_pos == y1) return array_length(ds_map_find_value(PDG_ROAD_NETWORK, self.key));
	
	return 0;
}