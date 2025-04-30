function scr_create_user_node_key(x_pos, y_pos, node_type)
{
	return string(x_pos) + "|" + string(y_pos) + "|" + string(node_type);
}

function scr_create_user_node_key_from_struct(struct)
{
	return string(struct.x_pos) + "|" + string(struct.y_pos) + "|" + string(struct.type);
}
