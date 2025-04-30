function angle_between_points(ap_x, ap_y, p_x1, p_y1, p_x2, p_y2)
{
	var current_vector_angle = true_point_direction(ap_x, ap_y, p_x1, p_y1);
	var second_vector_angle = true_point_direction(ap_x, ap_y, p_x2, p_y2);

	var angle_diff = second_vector_angle - current_vector_angle;

	if (angle_diff < 0) angle_diff += 360;

	return angle_diff;
}
