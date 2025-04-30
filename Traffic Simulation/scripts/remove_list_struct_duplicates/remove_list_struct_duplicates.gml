function remove_list_struct_duplicates(list, struct_function) {    
    for (var i = 0; i < array_length(list); i++) {
        var current_struct = list[i];
        var is_duplicate = false;

        // Compare the current struct with all previous structs in the list
        for (j = 0; j < i; j++) {
            if (struct_function(current_struct, list[j])) {
                is_duplicate = true;
                break;
            }
        }
        
        if (is_duplicate) {
            array_delete(list, i, 1);
            i--;
        }
    }
	
	return list;
}

function struct_PDG_connection(struct1, struct2) {
    var dupe_count = 0;
	
	if (struct1.x_pos == struct2.x_pos) dupe_count ++;
	if (struct1.y_pos == struct2.y_pos) dupe_count ++;
	
    if (dupe_count == 2) return true;
	return false;
}