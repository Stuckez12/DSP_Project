if !DEBUG_LINES exit;

draw_set_color(c_red);

for (var i = 0; i < array_length(main_connections); i++)
{
	var x1 = main_connections[i].x_pos;
	var y1 = main_connections[i].y_pos;
		
	var _dir = main_connections[i]._dir;
	var _dist = 32;
		
	var x2 = x + calculate_triangle_base_with_hypotenuse_opp_angle(_dist, _dir);
	var y2 = y + calculate_triangle_opp_with_hypotenuse_opp_angle(_dist, _dir);
	
	draw_line_width(x1, y1, x2, y2, 4);
}




var lines;

try { lines = junction_lane_line_collisions[pos].collisions; }
catch(e) { exit; }

draw_text(x, y, array_length(lines));

for (var i = 0; i < array_length(lines); i++)
{
	
	var x1 = lines[i].x1;
	var y1 = lines[i].y1;
	var x2 = lines[i].x2;
	var y2 = lines[i].y2;
	
	if lines[i].direct draw_set_color(c_purple);
	else draw_set_color(c_orange);
	
	draw_line_width(x1, y1, x2, y2, 4);
}

draw_set_color(c_green);

var coords = string_split(junction_lane_line_collisions[pos].lane_path_key, "|");

draw_line_width(real(coords[0]), real(coords[1]), real(coords[2]), real(coords[3]), 4);

draw_set_color(c_white);





