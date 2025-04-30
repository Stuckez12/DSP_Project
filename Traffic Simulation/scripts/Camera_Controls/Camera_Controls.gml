function Camera_Controls()
{
	if WAITING_FOR_INPUT return;
	
	// Check whether to return camera to simulation center
	Return_Camera()

	//Move Self
	Camera_Movement();

	//Camera Zoom Control
	Camera_Zoom();

	// Position camera on self
	camera_set_view_pos(view_camera[0],
						x - camera_get_view_width(view_camera[0]) / 2,
						y - camera_get_view_height(view_camera[0]) / 2
						);
}


function Camera_Movement()
{
	// Change camera movement speed depending on zoom level
	var movement_speed = max(8 * (CAMERA_ZOOM_LEVEL / 4), 8);
	
	// Move camera object according to WASD direction and zoom
	if (keyboard_check(ord("W"))) y -= movement_speed;
	if (keyboard_check(ord("S"))) y += movement_speed;
	if (keyboard_check(ord("A"))) x -= movement_speed;
	if (keyboard_check(ord("D"))) x += movement_speed;
}

function Camera_Zoom()
{
	var zoom_change = false;
	
	// Detect if scroll wheel has been used and change zoom level appropriately
	if mouse_wheel_up() { CAMERA_ZOOM_LEVEL--; zoom_change = true; }
	else if mouse_wheel_down() { CAMERA_ZOOM_LEVEL++; zoom_change = true; }
	
	// End script if no changes were made
	if (!zoom_change) return;
	
	// Upper lower boundaries for camera zoom
	if (1 >= CAMERA_ZOOM_LEVEL) CAMERA_ZOOM_LEVEL = 1;
	if (50 < CAMERA_ZOOM_LEVEL) CAMERA_ZOOM_LEVEL = 50;

	// Set camera zoom to new zoom level
	var zoom_multiplier = CAMERA_ZOOM_LEVEL / 10;
	camera_set_view_size(view_camera[0], 1366 * zoom_multiplier, 768 * zoom_multiplier);
}

function Return_Camera()
{
	if keyboard_check_pressed(ord("Q"))
	{
		x = 0;
		y = 0;
	}
}