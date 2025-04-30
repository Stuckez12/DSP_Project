function is_point_near_line(px1, py1, lx1, ly1, lx2, ly2, max_distance=0)
{
	// Line coefficients
	var a = ly2 - ly1;
	var b = lx1 - lx2;
	var c = (lx2 * ly1) - (lx1 * ly2);
	
	// Calculate distance from point to line 
	var distance = abs((a * px1) + (b * py1) + c) / sqrt((a * a) + (b * b))
	
	// Return boolean if checking for line within range, else return distance
	if (max_distance != 0) return distance <= max_distance;

	return distance;
}