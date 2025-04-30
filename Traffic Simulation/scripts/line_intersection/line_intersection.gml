function line_intersection(x1, y1, x2, y2, x3, y3, x4, y4)
{
    // Calculate determinant
	var ux1 = x2 - x1;
	var ux2 = x4 - x3;
	var uy1 = y2 - y1;
	var uy2 = y4 - y3;

    var determinant = (ux1 * uy2) - (uy1 * ux2);
    
    // Return false if lines are parallel
    if (determinant == 0) {
        return { result: false, x_pos: 0, y_pos: 0, t: 0, u: 0 };
    }
	
	var start_x = x3 - x1;
	var start_y = y3 - y1;
    
    // Calculate line intersections
    var l1_its = ((start_x * uy2) - (start_y * ux2)) / determinant;
    var l2_its = ((start_x * uy1) - (start_y * ux1)) / determinant;
    
    // Check if both line intersections are between 0 - 1
    if ((l1_its >= 0 && l1_its <= 1) && (l2_its >= 0 && l2_its <= 1)) {
        // Calculate intersection point and return position
        var ix = x1 + (l1_its * ux1);
        var iy = y1 + (l1_its * uy1);
        return { result: true, x_pos: ix, y_pos: iy, t: l1_its, u: l1_its };
    }
    
    // Return false
    return { result: false, x_pos: 0, y_pos: 0, t: 0, u: 0 };
}


function check_all_graph_connections_to_(x3, y3, x4, y4)
{
	var size = ds_map_size(PDG_ROAD_NETWORK) ;
	var key = ds_map_find_first(PDG_ROAD_NETWORK);
	for (var i = 0; i < size - 1; i++;)
	{
	    var x1 = key.x_pos;
		var y1 = key.y_pos;
	
		var connections = ds_map_find_value(PDG_ROAD_NETWORK, key);

		for (var j = 0; j < array_length(connections); j++)
		{
			var structure = connections[j];
		
			var x2 = structure.x_pos;
			var y2 = structure.y_pos;

			draw_line(x1, y1, x2, y2);
			
			var intersection = line_intersection(x1, y1, x2, y2, x3, y3, x4, y4);
			
			if intersection.result
			{
				if (intersection.t == 1 or intersection.t == 0) continue;
				if (intersection.u == 1 or intersection.u == 0) continue;
				
				return intersection;
			}
		}
	
		key = ds_map_find_next(PDG_ROAD_NETWORK, key);
	}
	
	return { result: false };
}































