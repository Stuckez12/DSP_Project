var found = false;
var new_type = node_type_input.current_selected_item;
var valid_inputs = ["REGULAR", "SPAWNER", "SIGNALLED"];

for (var i = 0; i < array_length(valid_inputs); i++)
{
	if (valid_inputs[i] == new_type)
	{
		found = true;
	}
}

if !found
{
	global.error_set_node_type_message = "No speed entered";
	global.error_set_node_type_timer = 120;
	
	exit;
}

var x1 = ROAD_LINE_SELECTED[0];
var y1 = ROAD_LINE_SELECTED[1];

update_road_type(x1, y1, new_type);

DROPDOWN_SELECTED = false;
WAITING_FOR_INPUT = false;
ROAD_LINE_SELECTED = [];
ROAD_SPEED_SELECTED = 0;

instance_destroy(node_type_input);
instance_destroy(self);