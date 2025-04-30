function detect_node(set_last_node=false, get_node_key=false)
{
	if instance_exists(Node)
	{
		var closest_node = instance_nearest(mouse_x, mouse_y, Node);
		var distance = pythagorus(closest_node.x, closest_node.y, mouse_x, mouse_y);
		
		var dist_min = (get_node_key) ? 32 : 128;

		if (distance < dist_min)
		{ 
			if set_last_node
			{
				LAST_NODE = closest_node.key;
				return true;
			}
			else if get_node_key return closest_node.key;
			else return true;	
		}
	}
	
	return false;
}