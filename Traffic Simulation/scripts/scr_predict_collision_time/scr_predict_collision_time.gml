function scr_predict_collision_time(self_velocity, vehicle_distance, vehicle_speed)
{
    if (self_velocity == vehicle_speed) return { coll: false, dist: 0 };

    var time = (vehicle_distance * 1) / (self_velocity - vehicle_speed);

    if (time < 0) return { coll: false, dist: 0 };

    var collision_distance = self_velocity * time;

    return { coll: true, dist: collision_distance };
}

function scr_distance_to_standstill(velocity, brake_force)
{
    if (velocity <= 0) return 0;	
	
	return sqr(velocity) / (2 * brake_force);
}
