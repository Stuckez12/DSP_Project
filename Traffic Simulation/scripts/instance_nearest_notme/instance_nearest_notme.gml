function instance_nearest_notme(xx, yy, obj)
{
    var inst_id = noone;
    var closest_dist = infinity;

    with (obj)
	{
        var dist = point_distance(x, y, xx, yy);

        if (id != other.id) and (dist < closest_dist)
		{
            inst_id = id;
            closest_dist = dist;
        }
    }
	
    return inst_id;
}