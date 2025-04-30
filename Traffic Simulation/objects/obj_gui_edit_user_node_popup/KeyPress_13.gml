var found = false;
var found2 = false;
var new_type = node_type_input.current_selected_item;
var new_spawner_type = node_spawner_type_input.current_selected_item;
var valid_inputs = ["REGULAR", "SPAWNER", "SIGNALLED"];
var valid_inputs_2 = ["SLOW", "MODERATE", "CONTINUOUS"];

for (var i = 0; i < array_length(valid_inputs); i++)
{
	if (valid_inputs[i] == new_type)
	{
		found = true;
		break;
	}
}

for (var i = 0; i < array_length(valid_inputs_2); i++)
{
	if (valid_inputs_2[i] == new_spawner_type)
	{
		found2 = true;
		break;
	}
}

if !found or !found2
{
	global.error_set_node_type_message = "Invalid Dropdown Inputs";
	global.error_set_node_type_timer = 180;
	
	exit;
}

var x1 = ROAD_LINE_SELECTED[0];
var y1 = ROAD_LINE_SELECTED[1];

var key = scr_create_user_node_key(x1, y1, ROAD_TYPE_SELECTED);

scr_update_user_node_type(key, new_type, new_spawner_type);

DROPDOWN_SELECTED = false;
WAITING_FOR_INPUT = false;
ROAD_LINE_SELECTED = [];
ROAD_SPEED_SELECTED = 0;

instance_destroy(node_type_input);
instance_destroy(node_spawner_type_input);
instance_destroy(self);
