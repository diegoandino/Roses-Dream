///Creates a menu page for the pause menu
///@arg ["Name1", type1, entries1...]
///@arg ["Name2", type2, entries2...]

var arg, i = 0; 

repeat (argument_count) {
	arg[i] = argument[i]; 
	i++; 
}

//Fills grid for the different menu objects 
var ds_grid_id = ds_grid_create(5, argument_count);
i = 0; 

repeat (argument_count) {
	var arr = arg[i]; 
	var arr_len = array_length_1d(arr); 
	
	var xx = 0; 
	repeat (arr_len) {
		ds_grid_id[# xx, i] = arr[xx];
		xx++; 
	}
	
	i++; 
}

return ds_grid_id; 