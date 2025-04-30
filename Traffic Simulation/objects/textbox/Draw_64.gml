draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite(s_textbox, 0, draw_at_x, draw_at_y)
draw_text(draw_at_x - 122,draw_at_y-32, input_label);
draw_text(draw_at_x - 122,draw_at_y, text);