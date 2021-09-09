// Gets a row and column value and parses it into a table-style string.
// i.e. [0, 0] --> "A1"
function tablecoord_set(col, row) {
    return chr(uc_A+col) + str(row+1);
}

// Gets a table-style coordenate and parses it into a Vector2.
// i.e. "A1" --> [0, 0]
function tablecoord_get(strng) {
	var x_ = ord(char_at(strng, 1)) - uc_A;
	var y_ = real(char_at(strng, 2)) - 1;
    return new Vector2(x_, y_);
}


function draw_table_centered(x, y, w, h, dsgrid, col_border, col_true, col_false, showcoord) {
	var cols = dsg_w(dsgrid);
	var rows = dsg_h(dsgrid);
	var ws = w / cols;
	var hs = h / rows;
	var ss = ws < hs ? ws : hs;
	var px = x + (w - cols*ss) / 2;
	var py = y + (h - rows*ss) / 2;
	var ex = px + cols*ss;
	var ey = py + rows*ss;
	if (showcoord) {
    	var hold_ha = draw_get_halign();
    	var hold_va = draw_get_valign();
    	draw_set_halign(fa_center);
    	draw_set_valign(fa_middle);
	}
	for (var i=0; i<cols; i++)
		for (var j=0; j<rows; j++) {
		    var sx = px+(ss*i);
		    var sy = py+(ss*j);
			var color = dsg(dsgrid, i, j) ? col_true : col_false;
			draw_rect_inout(sx, sy, ss, ss, color, col_border);
			if (showcoord)
			    draw_text_col(sx+ss/2, sy+ss/2, tablecoord_set(i, j), col_border);
		}
	if (showcoord) {
	    draw_set_halign(hold_ha);
	    draw_set_valign(hold_va);
	}
}