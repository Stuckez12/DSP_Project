switch(state)
{
	case "compact":
		draw_text(draw_at_x_dropdown + 6, draw_at_y_dropdown - 32, input_label);
		draw_sprite(s_dropdown_selected, 0, draw_at_x_dropdown, draw_at_y_dropdown);
		draw_sprite(s_dropdown_arrow, 0, draw_at_x_dropdown + 224, draw_at_y_dropdown);
		
		draw_text(draw_at_x_dropdown + 8, draw_at_y_dropdown + 12, current_selected_item);
		
		break;
		
	case "dropped":
		draw_text(draw_at_x_dropdown + 6, draw_at_y_dropdown - 32, input_label);
		draw_sprite(s_dropdown_selected, 0, draw_at_x_dropdown, draw_at_y_dropdown);
		draw_sprite(s_dropdown_arrow, 1, draw_at_x_dropdown + 224, draw_at_y_dropdown);
		
		draw_text(draw_at_x_dropdown + 8, draw_at_y_dropdown + 12, current_selected_item);
		
		for (var i = 0; i < array_length(all_items); i++)
		{
			var y_addon = 32 * (i + 1);
			var selection_frame = 0
			
			if(all_items[i] == current_selected_item) selection_frame = 1;
			
			draw_sprite(s_dropdown_options, selection_frame, draw_at_x_dropdown, draw_at_y_dropdown + y_addon);
			draw_text(draw_at_x_dropdown + 8, draw_at_y_dropdown + 12 + y_addon, all_items[i]);
		}
		
		break;
}