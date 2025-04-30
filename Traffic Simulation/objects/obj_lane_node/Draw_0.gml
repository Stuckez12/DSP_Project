


function node_conn_flow()
{
	for (var i = 0; i < array_length(other_connections); i++)
	{
		var key_data = scr_extract_lane_connection_key_values(other_connections[i]);
		
		var xx = key_data.x_pos;
		var yy = key_data.y_pos;
		
		var dist = pythagorus(x, y, xx, yy) / 1.5;
		var _dir = calculate_point_angle(x, y, xx, yy);

		var curr_x = x + calculate_triangle_base_with_hypotenuse_opp_angle(dist, _dir);
		var curr_y = y + calculate_triangle_opp_with_hypotenuse_opp_angle(dist, _dir);

		draw_line_width(x, y, curr_x, curr_y, 2);
	}
}

for (var i = 0; i < array_length(self.other_connections); i++)
{
	var key = self.other_connections[i];
	var key_data = scr_extract_lane_connection_key_values(key);
	
	draw_set_color(c_black);
	
	if (NETWORK_VISUALS != "NONE")
	{
		var max_search = 0;
		
		switch(NETWORK_VISUALS)
		{
			case "MOST RECENT": max_search = 1; break;
			case "RECENT": max_search = 10; break;
			case "ALL TIME": max_search = infinity; break;
		}
		
		var total_speed = 0;
		var count = 0;
		var dist = pythagorus(lane_node_pos[0], lane_node_pos[1], key_data.x_pos, key_data.y_pos);
		
		for (var j = array_length(pass_through_data) - 1; j >= 0; j--) 
		{
			if (pass_through_data[j].to == key) { total_speed += pass_through_data[j].time_passed; count++; }
			if (count >= max_search) break;
		}
		
		if (total_speed != 0)
		{
			var average_speed = dist / ((total_speed / count) / 16.67);
			var lane_speed = scr_get_lane_speed_limit(key) / 10;
			var percentage = (average_speed / lane_speed) * 10;

			if (lane_node_pos[0] == 100.88) and (lane_node_pos[1] == 125.55) show_debug_message("Percentage: " + string(percentage));

			draw_set_color(scr_lane_color_transition(percentage));
		}
		else draw_set_color(c_black);
		
		draw_line_width(lane_node_pos[0], lane_node_pos[1], key_data.x_pos, key_data.y_pos, 12);
	}
	else draw_line_width(lane_node_pos[0], lane_node_pos[1], key_data.x_pos, key_data.y_pos, 12);
}


if !DEBUG_LINES exit;

if (connecting_node and keyboard_check(ord("4")))
{

node_conn_flow();
	
}
else if (!connecting_node and keyboard_check(ord("5")))
{

node_conn_flow();

}

else if (!connecting_node and keyboard_check(ord("6")))
{

var xx = conn_node_pos[0];
var yy = conn_node_pos[1];
		
var dist = pythagorus(x, y, xx, yy) / 1.5;
var _dir = calculate_point_angle(x, y, xx, yy);

var curr_x = x + calculate_triangle_base_with_hypotenuse_opp_angle(dist, _dir);
var curr_y = y + calculate_triangle_opp_with_hypotenuse_opp_angle(dist, _dir);

draw_line_width(x, y, curr_x, curr_y, 2);

}

draw_set_color(c_white);
draw_text(x, y, "Speed Limit: " + string(speed_limit));




























