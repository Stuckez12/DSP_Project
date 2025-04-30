draw_circle(x, y, 8, false);

draw_set_color(c_purple);
for (var i = 0; i < array_length(other_connections); i++)
{
	//draw_line_width(x, y, other_connections[i].x_pos, other_connections[i].y_pos, 4);
}
draw_set_color(c_white);

var display = "X: " + string(x) + " | Y: " + string(y);

draw_set_color(c_blue);
draw_text_transformed(x, y, display, 0.5, 0.5, 35);
draw_set_color(c_white);