function scr_within_order(current, in, out)
{
	if (sign(in - current) == sign(out - current)) return true;
	return false;
}
