function scr_extract_user_node_key_values(key)
{
	var values = string_split(key, "|");
	
	var key_vals = {
		x_pos: real(values[0]),
		y_pos: real(values[1]),
		type: values[2],
	}
	
	return key_vals;
}
