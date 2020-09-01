/// @desc	Same as "ds_grid_get()".
/// @param	grid	The DS Grid to check.
/// @param	x_		The X value of the grid to check.
/// @param	y_		The Y value of the grid to check.
/// @return			The value found in the coordinates.
function dsg(grid, x_, y_)
{
	return ds_grid_get(grid, x_, y_);
}