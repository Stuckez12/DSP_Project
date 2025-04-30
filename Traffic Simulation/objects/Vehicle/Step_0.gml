

var vd_accel_dist = 24 + (velocity * 3);
var vd_brake_dist = 20 + (velocity * 2.5);
var vd_signal_pos = 24 + (velocity * 4);

// add function to calculate distance to brake

var vehicle_detection = detect_next_vehicle_distance(x, y, path, 256, destination, Vehicle);


var vehicle_data = {
	accel_state: vehicle_movement_state,
	object_state: 0,
	current_velocity: velocity,
	min_accel_dist: vd_accel_dist,
	min_brake_dist: vd_brake_dist,
	signal_pos: vd_signal_pos
	}
	
var road_data = {
	speed_limit: 0,
	coll: false // is there a infrastructure element preventing you from moving
	}


var return_actions = vehicle_state_controller(vehicle_data, vehicle_detection, road_data);








velocity = vehicle_velocity(vehicle_movement_state, velocity);

var pos = move_across_points(x, y, path, velocity, destination);

x = pos.x_pos;
y = pos.y_pos;
direction = pos.dir;

for (var i = 0; i < pos.shifts; i++) array_shift(path);
