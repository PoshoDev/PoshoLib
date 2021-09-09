/// Draw
function draw_sprite_scale(spr, subimg, x, y, scale){
    var blend = draw_get_color();
    var alpha = draw_get_alpha();
    draw_sprite_ext(spr, subimg, x, y, scale, scale, 0, blend, alpha);
}

/// Math
function mouse_in_rectangle(x, y, w, h){
    return point_in_rectangle(mx, my, x, y, x+w, y+h);
}