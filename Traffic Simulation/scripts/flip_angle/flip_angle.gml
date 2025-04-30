function flip_angle(current_angle){
	flipped_value = 180 - current_angle;
	
	if (flipped_value < 0) flipped_value += 360;

	return flipped_value;
}