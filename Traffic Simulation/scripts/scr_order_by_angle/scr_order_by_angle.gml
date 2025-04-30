function scr_order_by_angle(x1, y1, list, is_key)
{
	var ordered_list = [];
	
	var temp_list = [];
	
	array_copy(temp_list, 0, list, 0, array_length(list));
	
	for (var i = 0; i < array_length(list); i++)
	{
		var pos = -1;
		var smallest = 360;
		
		for (var j = 0; j < array_length(temp_list); j++)
		{
			var node;

			if is_key {  node = scr_extract_user_node_key_values(temp_list[j]); }
			else { node = temp_list[j]; }
			
			var x2 = node.x_pos;
			var y2 = node.y_pos;
			
			var dir = true_point_direction(x1, y1, x2, y2);
			
			if (dir < smallest)
			{
				pos = j;
				smallest = dir;
			}
		}
		
		if (pos == -1) continue;
		
		array_push(ordered_list, temp_list[pos]);
		array_delete(temp_list, pos, 1);
	}
	
	return ordered_list;
}
