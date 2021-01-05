/// RECTANGLES

function draw_rect_col(x, y, w, h, color, outline)
{
	draw_rectangle_color(x, y, x+w, y+h, color, color, color, color, outline);
}



/// ROUNDRECTS

function draw_roundr_col(x, y, w, h, color, outline)
{
	draw_roundrect_color(x, y, x+w, y+h, color, color, outline);
}

// Draws a RoundRect with a given alpha, inner color and outline color.
function draw_roundr_plus(x, y, w, h, color_in, color_out, alpha)
{
	var current = draw_get_alpha();
	
	draw_set_alpha(alpha);
	draw_roundr_col(x, y, w, h, color_in, false);
	
	draw_set_alpha(current);
	draw_roundr_col(x, y, w, h, color_out, true);
}