// Camera Global Variable
globalvar CAMERA_ZOOM_LEVEL; CAMERA_ZOOM_LEVEL = 10;



// Network Graphs
globalvar PDG_ROAD_NETWORK; PDG_ROAD_NETWORK = ds_map_create();
globalvar LPDG_LANE_ROAD_NETWORK; LPDG_LANE_ROAD_NETWORK = ds_map_create();



// Network Editor Mode Global Variable
globalvar ROAD_EDIT_MODE; ROAD_EDIT_MODE = "CREATE";



// Create Road Network Global Variables
globalvar LAST_NODE; LAST_NODE = undefined;
globalvar ROAD_TYPE_SELECTED; ROAD_TYPE_SELECTED = undefined;



// Edit Road Selection Global Variables
globalvar ROAD_LINE_SELECTED; ROAD_LINE_SELECTED = [];
globalvar ROAD_SPEED_SELECTED; ROAD_SPEED_SELECTED = 0;
globalvar ROAD_SPAWNER_TYPE_SELECTED; ROAD_SPAWNER_TYPE_SELECTED = "";



// Simulation Global Variables
globalvar SIMULATION_ACTIVE; SIMULATION_ACTIVE = false;
globalvar SIMULATION_GENERATED_PATHS; SIMULATION_GENERATED_PATHS = [];
globalvar SIMULATION_RUNNING; SIMULATION_RUNNING = false;



// Vehicle Behaviour Global Variable
globalvar VEHICLE_TIMER; VEHICLE_TIMER = 0;



// GUI Popup Global Variables
globalvar WAITING_FOR_INPUT; WAITING_FOR_INPUT = false;
globalvar DROPDOWN_SELECTED; DROPDOWN_SELECTED = false;
globalvar MOUSE_IN_GUI; MOUSE_IN_GUI = false;
globalvar IS_APP_WINDOWED; IS_APP_WINDOWED = 0;
globalvar NETWORK_VISUALS; NETWORK_VISUALS = "NONE";



// Saving And Loading
globalvar CURRENT_FILE_NAME; CURRENT_FILE_NAME = "Untitled Simulation.json";
globalvar CURRENT_FILE_PATH; CURRENT_FILE_PATH = "";



// Final Simulation Settings
globalvar DEBUG_LINES; DEBUG_LINES = false;





game_set_speed(60, gamespeed_fps);
window_set_fullscreen(false);
room_goto(Second_Iteration);
































