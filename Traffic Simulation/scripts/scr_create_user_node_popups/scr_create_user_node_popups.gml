function scr_create_user_node_popup()
{
	if !instance_exists(obj_gui_edit_user_node_popup) instance_create_layer(0, 0, "GUI", obj_gui_edit_user_node_popup);
}

function scr_create_user_node_connection_popup()
{
	if !instance_exists(obj_gui_edit_user_node_connection_popup) instance_create_layer(0, 0, "GUI", obj_gui_edit_user_node_connection_popup);
}

