velocity = 0;
max_speed = 12;

acceleration_base = 0.01;
acceleration_factor = 0.02;
acceleration_max = 0.15

brake_force = 0.2;
_friction = 0.05;


vehicle_movement_state = 1;
object_state = 0;

absolute_min_distance = 30;

path = [];
destination = {};

next_position = {};
last_position = "";
last_point_time = current_time;

depth = -1000;