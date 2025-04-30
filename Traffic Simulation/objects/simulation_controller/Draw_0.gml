var total_paths = array_length(SIMULATION_GENERATED_PATHS);

if keyboard_check_pressed(ord("2")) if(pos < total_paths - 1) pos ++;
if keyboard_check_pressed(ord("3")) if(pos > 0) pos --;

if (pos > total_paths - 1) pos = total_paths - 1;
if (pos < 0) pos = 0;

if !SIMULATION_ACTIVE exit;
if (total_paths == 0) exit;

var path = SIMULATION_GENERATED_PATHS[pos];

draw_set_color(c_purple);

for (var i = 0; i < array_length(path.route) - 1; i++)
{
	var x1 = path.route[i].x_pos;
	var y1 = path.route[i].y_pos;
	var x2 = path.route[i+1].x_pos;
	var y2 = path.route[i+1].y_pos;
	
	draw_line_width(x1, y1, x2, y2,4);
}
draw_set_color(c_white);



































