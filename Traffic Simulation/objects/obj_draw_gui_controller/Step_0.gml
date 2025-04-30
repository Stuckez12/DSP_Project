#region Upper GUI button controls + response

var mouse_screen_x = device_mouse_x_to_gui(0);
var mouse_screen_y = device_mouse_y_to_gui(0);

//Ignore if mouse is not on gui zone
if (mouse_screen_y > gui_height)
{
	MOUSE_IN_GUI = false;
	exit;
}

MOUSE_IN_GUI = true;

if !mouse_check_button_pressed(mb_left) exit;
if WAITING_FOR_INPUT exit;

for (var i = 0; i < array_length(all_button_positions); i++)
{
	var x_pos = all_button_positions[i].pos_x;
	var y_pos = all_button_positions[i].pos_y;
	
	if (mouse_screen_x < x_pos) or (mouse_screen_x > x_pos + (gui_button_width * button_width)) continue;
	if (mouse_screen_y < y_pos) or (mouse_screen_y > y_pos + (gui_button_height * button_height)) continue;
	
	var button_x = all_button_positions[i].button_x;
	var button_y = all_button_positions[i].button_y;
	
	for (var j = 0; j < array_length(button_actions); j++)
	{
		if (button_actions[j][0] != button_x) continue;
		if (button_actions[j][1] != button_y) continue;
		
		var func = button_actions[j][4];
		
		func();
		
		break;
	}
}

#endregion