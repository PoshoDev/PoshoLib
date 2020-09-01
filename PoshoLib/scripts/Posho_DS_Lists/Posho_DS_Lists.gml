/// @desc	Short form for "ds_list_find_value()".
/// @return	The found value in the DS List.
function dsl(list, index)
{
	return ds_list_find_value(list, index);
}


/// @desc	Short form for "ds_list_add()".
function dsl_add(list, value)
{
	ds_list_add(list, value);
}


/// @desc	Short form for "ds_list_size()".
/// @return	The size of the DS List.
function dsl_size(list)
{
	return ds_list_size(list);
}
