function scr_remove_dupe_strings_in_list(array)
{
    var unique_array = [];
    var count = array_length(array);
    
    for (var i = 0; i < count; i++)
	{
        var value = array[i];
        
        if (!array_contains(unique_array, value)) array_push(unique_array, value);
    }
    
    return unique_array;
}


function array_contains(array, value) {
    var len = array_length(array);
	
    for (var i = 0; i < len; i++) if (array[i] == value) return true;

    return false;
}