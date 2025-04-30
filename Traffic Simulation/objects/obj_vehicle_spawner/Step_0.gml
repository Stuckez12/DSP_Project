if !SIMULATION_RUNNING exit;

//if instance_exists(obj_vehicle) exit;

if (spawn_rate == infinity)
{
	switch (type)
	{
		case "SLOW": spawn_rate = irandom_range(300, 400); break;
		case "MODERATE": spawn_rate = irandom_range(150, 225); break;
		case "CONTINUOUS": spawn_rate = irandom_range(60, 90); break;
	}
}

timer++;

var path_to_take = routes[irandom_range(0, array_length(routes) - 1)];
	
var start = path_to_take.start;
	
var xx = start.x_pos;
var yy = start.y_pos;
	
var next_pos = path_to_take.route[1];
	
var next_key = scr_extract_lane_connection_key_values(next_pos);
	
var next_x = next_key.x_pos;
var next_y = next_key.y_pos;
	
var speed_limit = scr_get_lane_speed_limit(string(xx) + "|" + string(yy));

var dist = point_distance(xx, yy, next_x, next_y);
var checking_dist = min(speed_limit * 32, dist);
		
var dir = true_point_direction(xx, yy, next_x, next_y);
	
var x_dist = xx + calculate_triangle_base_with_hypotenuse_opp_angle(checking_dist, dir);
var y_dist = yy + calculate_triangle_opp_with_hypotenuse_opp_angle(checking_dist, dir);
		
var detect = collision_line(xx, yy, x_dist, y_dist, obj_vehicle, false, true);
		
if (detect != noone) exit;
if (timer < spawn_rate) exit;

timer = 0;

var chance = irandom(9);
var object = (chance != 0) ? obj_car : obj_lorry;

var vehicle = instance_create_layer(xx, yy, "Vehicles", object);
	
array_copy(vehicle.path, 0, path_to_take.route, 0, array_length(path_to_take.route));
vehicle.next_position = path_to_take.route[0];
vehicle.last_position = path_to_take.route[0];
vehicle.destination = path_to_take.finish;
vehicle.velocity = speed_limit;

if (chance == 0) vehicle.absolute_min_distance = 62;

scr_randomise_vehicle_stats(vehicle);
