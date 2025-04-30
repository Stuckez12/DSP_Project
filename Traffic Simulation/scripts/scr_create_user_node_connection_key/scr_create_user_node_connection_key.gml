function scr_create_user_node_connection_key(x_pos, y_pos, speed_limit)
{
	return string(x_pos) + "|" + string(y_pos) + "|" + string(speed_limit);
}

function scr_create_user_node_connection_key_from_struct(struct)
{
	return string(struct.x_pos) + "|" + string(struct.y_pos) + "|" + string(struct.speed_limit);
}
