function calculate_hypotenuse_from_opp_side(known_side, angle_opp_ks)
{
	/*
	Equation to calculate the hypotenuse of a triangle is (Known Side * sin(opposite to X)) / sin(Opposite Angle to known side)
	
	Equation is simplified to the following due to the angle opposite to x always being 90 | sin(90) = 1
	
	known_side / degree_sin(angle opposite to known side) = hypotenuse

	*/
	
	return known_side / dsin(angle_opp_ks);
}

function calculate_opp_angle_with_hypotenuse(opposite_side, hypotenuse)
{
	/*
	Equation to calculate the angle when given the opposite side and the hypotenuse
	
	Equation is sin-1(opposite side / hypotenuse)
	
	sin-1 is equivelant to darcsin in code
	
	returns the angle for the given side lengths
	*/
	
	if(opposite_side > hypotenuse)
	{
		show_message("Calculating Triangle Angle Error: opposite side is longer than hypotenuse | os: " + string(opposite_side) + " / h: " + string(hypotenuse));
		exit;
	}
	
	return darcsin(opposite_side / hypotenuse);
}

function calculate_triangle_base_with_opposite_side(opposite_side, opposite_angle)
{
	/*
	
	*/
	
	return opposite_side / dtan(opposite_angle);
}

function calculate_triangle_opp_angle_with_base_and_opp_side(opposite_side, base_side)
{
	/*
	
	*/
	
	return darctan(opposite_side / base_side);
}

function calculate_triangle_base_with_hypotenuse_opp_angle(hypotenuse, opposite_angle)
{
	/*
	
	*/
	
	return hypotenuse * dcos(opposite_angle);
}

function calculate_triangle_opp_with_hypotenuse_opp_angle(hypotenuse, opposite_angle)
{
	/*
	
	*/
	
	return hypotenuse * dsin(opposite_angle);
}





























