if keyboard_check_pressed(ord("2")) pos ++;
if keyboard_check_pressed(ord("3")) pos --;

if (pos < 0) pos = array_length(SIMULATION_GENERATED_PATHS) - 1;
if (pos >= array_length(SIMULATION_GENERATED_PATHS)) pos = 0;