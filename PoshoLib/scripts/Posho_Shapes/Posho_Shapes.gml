/// @desc   Regular rectangle function, but uses width/height instead of absolute positions and takes color.
/// @param  x		The rectangle's start X.
/// @param  y		The rectangle's start Y.
/// @param  w		The rectangle's width.
/// @param  h		The rectangle's height.
/// @param  color	The color for the rectangle.
/// @param  outline	Whether to draw only the perimeter or not.
function draw_rect_col(x, y, w, h, color, outline)
{
	draw_rectangle_color(x, y, x+w, y+h, color, color, color, color, outline);
}