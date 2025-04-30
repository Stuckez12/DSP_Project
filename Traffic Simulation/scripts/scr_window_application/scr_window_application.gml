function scr_window_application()
{
	var is_fullscreen = window_get_fullscreen();
	
	if is_fullscreen window_set_fullscreen(false);
	else window_set_fullscreen(true);
}