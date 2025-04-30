function detect_next_vehicle_distance(x1, y1, pathway, travel_distance, destination, collision_obj)
{
	if (array_length(pathway) == 0) return { coll: false, x_pos : 0, y_pos : 0, dist: 0 };
	if (travel_distance == 0)		return { coll: false, x_pos : 0, y_pos : 0, dist: 0 };

	var current_x = x1;
	var current_y = y1;
	
	var next_x = pathway[0].x_pos;
	var next_y = pathway[0].y_pos;
	
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
		
		if (pos_left == pos) return { coll: false, x_pos : 0, y_pos : 0, dist: 0 };
		
		var collision_id = collision_line(current_x, current_y, new_x, new_y, collision_obj, false, true);
		
		if (collision_id != noone)
		{
			var xx = collision_id.x;
			var yy = collision_id.y;
			
			draw_line_width(current_x, current_y, xx, yy, 2);
			
			var half_distance = point_distance(current_x, current_y, xx, yy);
			var distance_from = ((distance - half_distance) + distance_left) - travel_distance;
			
			return { coll: true, x_pos : xx, y_pos : yy, dist: distance_from };
		}
		else draw_line_width(current_x, current_y, new_x, new_y, 2);
		
		if (new_x == destination.x_pos and new_y == destination.y_pos) break;
		if (distance_left == 0) break;

		pos ++;
		
		current_x = next_x;
		current_y = next_y;
	
		next_x = pathway[pos].x_pos;
		next_y = pathway[pos].y_pos;
	}
	
	return { coll: false, x_pos : 0, y_pos : 0, dist: 0 };
}