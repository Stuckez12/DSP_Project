state = dropdown_change_state(draw_at_x_dropdown, draw_at_y_dropdown, state);

// exit step event if dropdown is compacted
if (state == "compact") exit;

// code for selecting each item in dropdown
current_selected_item = change_selected_dropdown_item(draw_at_x_dropdown, draw_at_y_dropdown, all_items, current_selected_item);