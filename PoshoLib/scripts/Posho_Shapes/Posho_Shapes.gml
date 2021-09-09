/// LINES
function draw_line_col(x1, y1, x2, y2, color) {
	draw_line_color(x1, y1, x2, y2, color, color);
}

/// RECTANGLES

function draw_rect_col(x, y, w, h, color, outline) {
	draw_rectangle_color(x, y, x+w, y+h, color, color, color, color, outline);
}

function draw_rect_inout(x, y, w, h, color_in, color_out) {
	draw_rect_col(x, y, w, h, color_in, false);
	draw_rect_col(x, y, w, h, color_out, true);
}


/// ROUNDRECTS

function draw_roundr_col(x, y, w, h, radx, rady, color, outline) {
	draw_roundrect_color_ext(x, y, x+w, y+h, radx, rady, color, color, outline);
}

// Draws a RoundRect with a given alpha, inner color and outline color.
function draw_roundr_plus(x, y, w, h, radx, rady, color_in, color_out, alpha) {
	var current = draw_get_alpha();
	draw_set_alpha(alpha);
	draw_roundr_col(x, y, w, h, radx, rady, color_in, false);
	draw_set_alpha(current);
	draw_roundr_col(x, y, w, h, radx, rady, color_out, true);
}


/// GRIDS
// Fits a grid within a given area (centered).
function draw_grid_centered_col(x, y, w, h, cols, rows, color) {
	var ws = w / cols;
	var hs = h / rows;
	var ss = ws < hs ? ws : hs;
	var px = x + (w - cols*ss) / 2;
	var py = y + (h - rows*ss) / 2;
	var ex = px + cols*ss;
	var ey = py + rows*ss;
	for (var i=0; i<=cols; i++) {
		var pl = px + (ss*i);
		draw_line_col(pl, py, pl, ey, color);
	}
	for (var i=0; i<=rows; i++) {
		var pl = py + (ss*i);
		draw_line_col(px, pl, ex, pl, color);
	}
}


/// AXIS

// Draws two perpendicular lines at a given point.
function draw_axis(x, y) {
	draw_line(x, 0, x, rh);
	draw_line(0, y, rw, y);
}

// Draws an axis with a given color.
function draw_axis_col(x, y, color) {
	var hold = draw_get_color();
	draw_set_color(color);
	draw_axis(x, y);
	draw_set_color(hold);
}


/// PROGRESS BARS
function draw_progress(x, y, w, h, val_curr, val_max, col_in, col_out) {
	draw_rect_col(x, y, w, h, col_out, false);
	draw_rect_col(x, y, w*val_curr/val_max, h, col_in, false);
}
