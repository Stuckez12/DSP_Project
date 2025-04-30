function scr_detect_environment_elements(standstill_dist, checking_dist)
{
	var blockers = scr_detect_blockers(self.x, self.y, self.path, checking_dist, self.destination);
	var blocker_use = undefined;
	
	for (var i = 0; i < array_length(blockers); i++)
	{
		var blocker_data = blockers[i];
		var dist_from = blocker_data.dist;
		
		if (standstill_dist * 0.9 > dist_from) continue;

		blocker_use = blocker_data;
	}

	var vehicle = scr_detect_vehicle(self.x, self.y, self.path, checking_dist, self.destination);
	
	return [blocker_use, vehicle];
}

function scr_detect_blockers(x1, y1, pathway, travel_distance, destination)
{
	if (array_length(pathway) == 0) return [];
	if (travel_distance == 0)		return [];

	var current_x = x1;
	var current_y = y1;
	
	var point = scr_extract_lane_connection_key_values(pathway[0]);
	
	var next_x = point.x_pos;
	var next_y = point.y_pos;
	
	var new_x = 0;
	var new_y = 0;
	
	var distance_left = travel_distance;
	
	var pos = 0;
	var pos_left = array_length(pathway);
	
	var blocker_list = [];
	
	while (distance_left > 0)
	{
		var distance = point_distance(current_x, current_y, next_x, next_y);
		var dir = point_direction(current_x, current_y, next_x, next_y);
		
		if (distance >= distance_left) distance = distance_left;
		
		new_x = current_x + ((distance + 8) * dcos(dir));
		new_y = current_y - ((distance + 8) * dsin(dir));
		
		distance_left -= distance;
		
		var temp_blocker_list = ds_list_create();
		var collision_amount = collision_line_list(current_x, current_y, new_x, new_y, obj_lane_blocker_node, true, false, temp_blocker_list, true);
		
		for (var i = 0; i < collision_amount; i++)
		{
			var blocker = ds_list_find_value(temp_blocker_list, i);
	
			var xx = blocker.x;
			var yy = blocker.y;
			
			var half_distance = point_distance(current_x, current_y, xx, yy);
			var distance_from = travel_distance - ((distance - half_distance) + distance_left);
			
			var can_pass_list = blocker.can_pass_lane_list;
			var can_pass = true;
			var found = false;
			
			for (var j = 0; j < array_length(can_pass_list); j++)
			{
				var can_pass_pos = can_pass_list[j];
			
				if (next_x == can_pass_pos.x_pos) and (next_y == can_pass_pos.y_pos)
				{ can_pass = can_pass_pos.can_pass; found = true; break; }
			}
			
			var struct = {
				is_vehicle: false,
				x_pos: xx,
				y_pos: yy,
				dist: distance_from,
				v_speed: 0,
				can_pass: can_pass
			}

			array_push(blocker_list, struct);
		}
		
		ds_list_destroy(temp_blocker_list);
		
		if (new_x == destination.x_pos and new_y == destination.y_pos) break;
		if (distance_left == 0) break;

		pos ++;
		
		current_x = next_x;
		current_y = next_y;
		
		if (pos_left == pos) return blocker_list;
		
		var next_point = scr_extract_lane_connection_key_values(pathway[pos]);
	
		next_x = next_point.x_pos;
		next_y = next_point.y_pos;
	}

	return blocker_list;
}

function scr_detect_vehicle(x1, y1, pathway, travel_distance, destination)
{
	if (array_length(pathway) == 0) return undefined;
	if (travel_distance == 0)		return undefined;

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
		
		new_x = current_x + ((distance + 8) * dcos(dir));
		new_y = current_y - ((distance + 8) * dsin(dir));
		
		distance_left -= distance;
		
		if (pos_left == pos) return undefined;
		
		var collision_id = collision_line(current_x, current_y, new_x, new_y, obj_vehicle, false, true);
		
		draw_line_width(current_x, current_y, new_x, new_y, 4);
		
		if (collision_id != noone)
		{
			var xx = collision_id.x;
			var yy = collision_id.y;
			
			var half_distance = point_distance(current_x, current_y, xx, yy);
			var distance_from = travel_distance - ((distance - half_distance) + distance_left);
			
			//draw_line_width(current_x, current_y, xx, yy, 2);
			
			return {
					is_vehicle: true,
					x_pos: xx,
					y_pos: yy,
					dist: distance_from,
					v_speed: collision_id.velocity
				}
		}
		//else draw_line_width(current_x, current_y, new_x, new_y, 2);
		
		if (new_x == destination.x_pos and new_y == destination.y_pos) break;
		if (distance_left == 0) break;

		pos ++;
		
		current_x = next_x;
		current_y = next_y;
		
		var next_point = scr_extract_lane_connection_key_values(pathway[pos]);
	
		next_x = next_point.x_pos;
		next_y = next_point.y_pos;
	}

	return undefined;
}
