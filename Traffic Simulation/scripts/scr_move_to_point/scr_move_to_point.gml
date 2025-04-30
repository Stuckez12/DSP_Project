function scr_move_to_point(x1, y1, position, velocity)
{
	var point = scr_extract_lane_connection_key_values(position);
	
	var pos_x = point.x_pos;
	var pos_y = point.y_pos;
	
	var dir = point_direction(x1, y1, pos_x, pos_y);
	
	var distance = point_distance(x1, y1, pos_x, pos_y);
	
	if (distance < velocity) return { x_pos: pos_x, y_pos: pos_y, dir: dir };
	
	var new_x = x1 + velocity * dcos(dir);
	var new_y = y1 - velocity * dsin(dir);
	
	return { x_pos: new_x, y_pos: new_y, dir: dir };
}

function scr_move_across_points(x1, y1, pathway, travel_distance, destination)
{
	if (array_length(pathway) == 0)
	{
		instance_destroy(self);
		return { x_pos: x1, y_pos: y1, dir: direction, shifts: 0 };
	}
	
	if (travel_distance == 0) return { x_pos: x1, y_pos: y1, dir: direction, shifts: 0 };
	
	var current_x = x1;
	var current_y = y1;
	
	var point = scr_extract_lane_connection_key_values(pathway[0]);
	
	var next_x = point.x_pos;
	var next_y = point.y_pos;
	
	var new_x = 0;
	var new_y = 0;
	
	var distance_left = travel_distance;
	
	var pos = 0;
	var pos_left = array_length(pathway) - 1;
	
	while (distance_left > 0)
	{
		var distance = point_distance(current_x, current_y, next_x, next_y);
		var dir = point_direction(current_x, current_y, next_x, next_y);
		
		if (distance >= distance_left) distance = distance_left;
		
		new_x = current_x + distance * dcos(dir);
		new_y = current_y - distance * dsin(dir);
		
		distance_left -= distance;
		
		if (distance_left == 0) break;
		if (pos_left == pos)
		{
			scr_provide_movement_data(self.last_position, pathway[pos]);
			instance_destroy(self);
			return { x_pos: new_x, y_pos: new_y, dir: dir, shifts: pos };
		}
		
		if (new_x == destination.x_pos and new_y == destination.y_pos) break;
		
		scr_provide_movement_data(self.last_position, pathway[pos]);
		
		self.last_position = pathway[pos];
		
		pos ++;

		current_x = next_x;
		current_y = next_y;
		
		var next_point = scr_extract_lane_connection_key_values(pathway[pos]);
	
		next_x = next_point.x_pos;
		next_y = next_point.y_pos;
	}

	var dir = point_direction(current_x, current_y, next_x, next_y);
	
	return { x_pos: new_x, y_pos: new_y, dir: dir, shifts: pos };
}
