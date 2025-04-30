function scr_toggle_visuals()
{
	switch(NETWORK_VISUALS)
	{
		case "NONE": NETWORK_VISUALS = "MOST RECENT" break;
		case "MOST RECENT": NETWORK_VISUALS = "RECENT" break;
		case "RECENT": NETWORK_VISUALS = "ALL TIME" break;
		case "ALL TIME": NETWORK_VISUALS = "NONE" break;
	}
}
