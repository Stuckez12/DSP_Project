//draw_set_color(c_white);
//draw_circle(x, y, 12, false);

var passing = true;
var color = c_white;

for (var i = 0; i < array_length(can_pass_lane_list); i++)
{
	var can_pass = can_pass_lane_list[i];
	
	if is_signalled
	{
		if (!can_pass.can_pass) draw_set_color(c_red);
		else draw_set_color(c_green);
		
		draw_circle(x, y, 20, false);
	}
	else if (DEBUG_LINES) if (!can_pass.can_pass) { color = c_red; break; }
}

if !is_signalled and DEBUG_LINES
{
	draw_set_color(color);
	draw_circle(x, y, 20, false);
}

draw_set_color(c_white);


