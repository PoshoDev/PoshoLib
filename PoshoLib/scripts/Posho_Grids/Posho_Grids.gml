// Tries to randomly find a matching value from a DS Grid.
// Returns Vector2 of match, returns NULL otherwise.
function ds_grid_find_random_value(dsgrid, value) {
    var start_col = irandom(dsg_w(dsgrid)-1);
    var start_row = irandom(dsg_h(dsgrid)-1);
    var i = start_col;
    var j = start_row;
    var loop = false
    while (dsg(dsgrid, i, j) != value) {
        if (++i >= dsg_w(dsgrid)) {
            i = 0;
            if (++j >= dsg_h(dsgrid)) {
                j = 0;
                loop = true;
            }
        }
        if (loop && i==start_col && j==start_row)
            return NULL;
    }
    return new Vector2(i, j);
}