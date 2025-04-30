
function are_both_structs_equal(struct1, struct2)
{
	if (struct1.x_pos != struct2.x_pos) return false;
	if (struct1.y_pos != struct2.y_pos) return false;
	
	return true;
}

function are_both_structs_equal_advanced(struct1, struct2)
{
	if (struct1.lane_x != struct2.lane_x) return false;
	if (struct1.lane_y != struct2.lane_y) return false;
	if (struct1.node_x != struct2.node_x) return false;
	if (struct1.node_y != struct2.node_y) return false;
	if (struct1.in != struct2.in) return false;
	if (struct1.out != struct2.out) return false;
	
	return true;
}