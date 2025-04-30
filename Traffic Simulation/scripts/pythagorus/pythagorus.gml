function pythagorus(x1, y1, x2, y2)
{
	// Convert values to start at zero
	min_x = min(x1, x2);
	min_y = min(y1, y2);
	
	x1 -= min_x;
	x2 -= min_x;
	y1 -= min_y;
	y2 -= min_y;
	
	// Calculate and return pythagorus C
	x_len = x1 + x2;
	y_len = y1 + y2;
	
	return sqrt((x_len * x_len) + (y_len * y_len));
}



function pythagorus_length(base, opposite)
{
	return sqrt((base * base) + (opposite * opposite));
}