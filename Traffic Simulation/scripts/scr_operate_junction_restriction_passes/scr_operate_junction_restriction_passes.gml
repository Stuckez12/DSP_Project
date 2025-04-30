function scr_operate_junction_restriction_passes()
{
	var key_data = scr_extract_user_node_key_values(self.user_node_key);
	
	if(key_data.type == "REGULAR") scr_operate_regular_junction();
	else if(key_data.type == "SIGNALLED") scr_operate_signalled_junction();
}

function scr_operate_regular_junction(signalled=false)
{
	if (array_length(junction_lane_line_collisions) == 0)
	{
		scr_junction_line_collision_check_pos();
		self.blocker_list = scr_lane_node_blocker_creation(signalled);
	}
}

function scr_operate_signalled_junction()
{
	if !self.created
	{
		scr_operate_regular_junction(true);
		self.created = true;
	}
	
	self.active_blocker_timer++;

	if (self.active_blocker_timer <= self.active_blocker_timer_max) and (active_blocker != -1) return;
	
	var largest_timer = 10;
	var new_active = -1;
	
	for (var i = 0; i < array_length(self.blocker_list); i++)
	{
		if (self.active_blocker == i) continue;
		
		var blocker = self.blocker_list[i];
		var timer = blocker.present_vehicle_timer;
		
		if (largest_timer < timer) { largest_timer = timer; new_active = i; }
	}
	
	scr_signalled_swap_blocker_states(active_blocker, false);
	
	active_blocker = new_active;
	
	if (new_active == -1) return;
	
	scr_signalled_swap_blocker_states(new_active, true);
	
	self.active_blocker = new_active;
	self.active_blocker_timer = 0;
}

function scr_signalled_swap_blocker_states(active_blocker, state)
{
	if (active_blocker == -1) return;
	
	var can_pass = self.blocker_list[active_blocker].can_pass_lane_list;
	
	for (var i = 0; i < array_length(can_pass); i++) { can_pass[i].can_pass = state; }
	
	self.blocker_list[active_blocker].can_pass_lane_list = can_pass;
	self.blocker_list[active_blocker].is_passable_signalled = state;
}

















