function scr_create_lane_node_connection_key_from_struct(struct)
{
	return string(struct.x_pos) + "|" + string(struct.y_pos);
}