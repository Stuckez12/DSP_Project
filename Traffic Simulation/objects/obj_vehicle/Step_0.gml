if !SIMULATION_RUNNING exit;

var nearest = instance_nearest_notme(x, y, obj_vehicle);

if nearest != noone
{
	var dist = pythagorus(x, y, nearest.x, nearest.y);

	if dist < 12
	{
		if nearest.velocity > self.velocity instance_destroy(nearest);
		else instance_destroy(self);
	}
}

scr_vehicle_state_controller(scr_get_lane_speed_limit(self.last_position), self.velocity); 

self.velocity = vehicle_velocity(self.vehicle_movement_state, self.velocity);

var pos = scr_move_across_points(x, y, self.path, self.velocity, self.destination);

x = pos.x_pos;
y = pos.y_pos;
direction = pos.dir;
image_angle = pos.dir;
image_xscale = 0.5;
image_yscale = 0.2;


for (var i = 0; i < pos.shifts; i++) array_shift(self.path);
