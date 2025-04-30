function calculate_point_angle(x1, y1, x2, y2)
{
	var angle = darctan2(y2 - y1, x2 - x1);
	
	if (angle < 0) angle += 360;
	
	return angle;
}