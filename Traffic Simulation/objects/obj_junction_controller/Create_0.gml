user_node_key = "";

incoming_connections = []; //stores all user points going towards node
outgoing_connections = [];

all_connections = [];

main_connections = []; // stores two user points that will not be classified as joining roads

junction_lane_line_collisions = [];
blocker_list = [];

// Signalled Junction Behaviour
active_blocker = -1;
active_blocker_timer = 0;
active_blocker_timer_max = 300;

created = false;

pos = 0;

depth = -2000;