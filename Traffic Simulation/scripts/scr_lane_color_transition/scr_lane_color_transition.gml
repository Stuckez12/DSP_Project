function scr_lane_color_transition(percentage)
{
	var percent = clamp(percentage, 0, 1000);
	var r = 0;
	var g = 0;
	var b = 0;

	if (percent <= 50)
	{
	    var t = percent / 50;
	    r = 255;
	    g = 255 * t;
	}
	else if (percent <= 100)
	{
	    var t = (percent - 50) / 50;
	    r = 255 * (1 - t);
	    g = 255;
	}
	else if (percent <= 300)
	{
	    var t = (percent / 100) - 2;
	    g = 255 * (1 - t);
	    b = 255 * t;
	}
	else
	{
	    var t = percent / 1000;
	    r = 255 * t;
	    b = 255 * (1 - t);
	}

	return make_color_rgb(r, g, b);
}
