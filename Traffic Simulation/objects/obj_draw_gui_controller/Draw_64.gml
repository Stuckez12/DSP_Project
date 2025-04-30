//draw GUI backing
draw_set_color(c_grey);
draw_rectangle(0, 0, browser_width, gui_height, false);


draw_set_color(c_dkgray);

var mouse_screen_x = device_mouse_x_to_gui(0);
var mouse_screen_y = device_mouse_y_to_gui(0);

//draw gui button positions
for (var i = 0; i < array_length(all_button_positions); i++)
{
	var x_pos = all_button_positions[i].pos_x;
	var y_pos = all_button_positions[i].pos_y;
	
	var button_x = all_button_positions[i].button_x;
	var button_y = all_button_positions[i].button_y;
	
	var sprite = undefined;
	var sub_image = -1;
	
	for (var j = 0; j < array_length(button_actions); j++)
	{
		if (button_actions[j][0] != button_x) continue;
		if (button_actions[j][1] != button_y) continue;
		
		sprite = button_actions[j][2];
		sub_image = button_actions[j][3];
		
		break;
	}
	
	if (sprite == undefined) 
	{
		draw_rectangle(x_pos, y_pos, x_pos + (gui_button_width * button_width), y_pos + (gui_button_height * button_height), false);
		continue;
	}
	
	draw_sprite_ext(sprite, sub_image, x_pos, y_pos, gui_button_width, gui_button_height, 0, c_white, 1);
}


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
		
		var text = button_actions[j][5];
		var len = string_width(text);
		
		var x_min = 8;
		var x_max = len + 24;
		
		var text_pos = x_min * 2;
		
		if (mouse_screen_x + x_max > window_get_width() or mouse_screen_x + x_max > view_wport)
		{
			x_min *= -1;
			x_max *= -1;
			text_pos = x_max + 8;
		}
		
		draw_set_color(c_black);
		draw_rectangle(mouse_screen_x + x_min, mouse_screen_y, mouse_screen_x + x_max, mouse_screen_y + 24, false);
		draw_set_color(c_white);
		
		draw_text(mouse_screen_x + text_pos, mouse_screen_y + 0, text);
		
		break;
	}
}


draw_set_color(c_white);

draw_text(32,128,"Build Mode: " + ROAD_EDIT_MODE);
draw_text(32,144,"Visual Mode: " + NETWORK_VISUALS);




















