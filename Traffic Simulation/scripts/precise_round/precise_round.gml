function precise_round(value, dec)
{
	var mult = power(10, dec);

	return round(value * mult) / mult;
}