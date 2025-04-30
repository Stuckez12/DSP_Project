function calculate_lane_pos(a_x, a_y, v_x, v_y, cv_x, cv_y, in_out, min_distance)
{
	/*
	a_x = angle_x: the x position of where the calculated angle will be at
	a_y = angle_y: the y position of where the calculated angle will be at
	v_x = vector_x: the ending x position of the current vector
	v_y = vector_y: the ending y position of the current vector
	cv_x = connecting_vector_x: the x position of the vector affecting the current vector
	cv_y = connecting_vector_y: the y position of the vector affecting the current vector
	
	in_out: the side the position will be on
	*/

	var current_vector_angle = true_point_direction(a_x, a_y, v_x, v_y);
	var flipped_angle = flip_angle(current_vector_angle) + 180;
	
	var base_len = calculate_triangle_base_with_opposite_side(min_distance, 20);
	var hypotenuse_len = pythagorus_length(base_len, min_distance);
	
	var lane_x_pos = a_x + hypotenuse_len * dcos(flipped_angle + (20 * in_out));
	var lane_y_pos = a_y + hypotenuse_len * -dsin(flipped_angle + (20 * in_out));
	
	return { x_pos: lane_x_pos, y_pos: lane_y_pos };
}

function calculate_no_conn_lane_pos(a_x, a_y, v_x, v_y, in_out, min_distance)
{
	var current_vector_angle = point_direction(a_x, a_y, v_x, v_y);
	
	var point_dist = calculate_triangle_base_with_opposite_side(min_distance, current_vector_angle + (30 * in_out));
	
	var lane_pos_x = a_x + point_dist * dcos(-current_vector_angle);
	var lane_pos_y = a_y + point_dist * dsin(-current_vector_angle);

	return { x_pos: lane_pos_x, y_pos: lane_pos_y };
}























































