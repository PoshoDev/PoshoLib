// Give it a sprite and an area size and it'll give you the scale needed for it
// to fit inside the area (aspect ratio considered).
function sprite_scale_fit(spr, w, h) {
    var sc_w = w / spr_w(spr);
    var sc_h = h / spr_h(spr);
    return sc_w < sc_h ? sc_w : sc_h;
}

function spr_add(fname, removeback) {
    return sprite_add(fname, 1, removeback, true, 0, 0);
}

function spr_delete(spr) {
    if (sprite_exists(spr))
        sprite_delete(spr);
}