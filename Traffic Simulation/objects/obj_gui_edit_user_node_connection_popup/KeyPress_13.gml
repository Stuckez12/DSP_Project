if (string_length(speed_input.text) == 0)
{
	global.error_set_road_speed_message = "No speed entered";
	global.error_set_road_speed_timer = 120;

	exit;
}

var new_speed = real(speed_input.text);

if !(10 <= new_speed and new_speed <= 120)
{
	global.error_set_road_speed_message = "Speed must be between 10 - 120";
	global.error_set_road_speed_timer = 120;

	exit;
}

var x1 = ROAD_LINE_SELECTED[0];
var y1 = ROAD_LINE_SELECTED[1];
var x2 = ROAD_LINE_SELECTED[2];
var y2 = ROAD_LINE_SELECTED[3];

// Change speed to new speed
scr_update_user_node_connection_speed_limit(x1, y1, x2, y2, new_speed);
scr_update_user_node_connection_speed_limit(x2, y2, x1, y1, new_speed);

WAITING_FOR_INPUT = false;
ROAD_LINE_SELECTED = [];
ROAD_SPEED_SELECTED = 0;

instance_destroy(speed_input);
instance_destroy(self);