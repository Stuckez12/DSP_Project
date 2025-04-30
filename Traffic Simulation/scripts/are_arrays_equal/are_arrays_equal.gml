function are_arrays_equal(arr1, arr2)
{
    if (array_length(arr1) != array_length(arr2)) return false;  

    for (var i = 0; i < array_length(arr1); i++)
	{
        if (arr1[i] != arr2[i])  return false;
    }

    return true;
}