scr_operate_junction_restriction_passes();














var total_paths = array_length(junction_lane_line_collisions);

//show_debug_message(pos);

if keyboard_check_pressed(ord("7")) if(pos <= total_paths - 1) pos ++;
if keyboard_check_pressed(ord("8")) if(pos >= 0) pos --;

if (pos > total_paths - 1) pos = 0;
if (pos < 0) pos = total_paths - 1;