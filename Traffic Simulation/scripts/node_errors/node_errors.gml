function node_errors()
{
	if (global.error_create_edge_timer > 0)
	{
		global.error_create_edge_timer -= 1;
		
		draw_text(mouse_x, mouse_y, global.error_create_edge_message);
		
		if (round(global.error_create_edge_timer / round(100 / 8)) mod 2)
		{
			draw_set_color(c_red);
			draw_circle(global.error_create_edge_x, global.error_create_edge_y, 8, false);
			draw_set_color(c_white);
		}
	}
}


function show_next_node_connection()
{
	if (LAST_NODE == undefined) return;
	
	draw_line(LAST_NODE.x_pos, LAST_NODE.y_pos, mouse_x, mouse_y);
	draw_circle(mouse_x, mouse_y, 4, false);
}