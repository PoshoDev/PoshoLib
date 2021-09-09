// Draws a string limited to a rect region.
function draw_text_region(x, y, w, h, strng)
{
    var surf = surface_create(w, h);
    surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
        draw_text(0, 0, strng);
    surface_reset_target();
    draw_surface(surf, x, y);
    surface_free(surf);
}

function draw_text_col(x, y, strng, color) {
    draw_text_color(x, y, strng, color, color, color, color, def_alpha);
}

function draw_text_outline(x, y, strng, color_in, color_out) {
    var hold_color = draw_get_color();
    draw_set_color(color_out);
    draw_text(x+1, y+1, strng);
    draw_text(x-1, y+1, strng);
    draw_text(x+1, y-1, strng);
    draw_text(x-1, y-1, strng);
    draw_set_color(color_in);
    draw_text(x, y, strng);
    draw_set_color(hold_color);
}

function draw_text_outline_scale(x, y, strng, scale, color_in, color_out) {
    var hold_color = draw_get_color();
    draw_set_color(color_out);
    draw_text_transformed(x+1, y+1, strng, scale, scale, def_angle);
    draw_text_transformed(x-1, y+1, strng, scale, scale, def_angle);
    draw_text_transformed(x+1, y-1, strng, scale, scale, def_angle);
    draw_text_transformed(x-1, y-1, strng, scale, scale, def_angle);
    draw_set_color(color_in);
    draw_text_transformed(x, y, strng, scale, scale, def_angle);
    draw_set_color(hold_color);
}