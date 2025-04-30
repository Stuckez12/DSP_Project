function scr_randomise_vehicle_stats(vehicle_id)
{
	vehicle_id.acceleration_base = random_range(0.01, 0.001); // 0.01;
	vehicle_id.acceleration_factor = random_range(0.03, 0.005); // 0.02;
	vehicle_id.acceleration_max = random_range(0.2, 0.1); // 0.15;

	vehicle_id.brake_force = random_range(0.05, 0.3); // 0.2;
	vehicle_id._friction = random_range(0.02, 0.08); // 0.05;
}
