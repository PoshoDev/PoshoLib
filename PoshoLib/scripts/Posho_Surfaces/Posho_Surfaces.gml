function surf_start(w, h) {
    var surf = surface_create(w, h);
    surface_set_target(surf);
    return surf;
}

function surf_end(surf) {
    surface_reset_target();
    surface_free(surf);
}

function surf_save(surf, fname) {
    var removeback = argc > 2 ? arg[2] : false;
    var smooth     = argc > 3 ? arg[3] : true;
    var spr = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf),
              surface_get_height(surf), removeback, smooth, 0, 0);
    sprite_save(spr, 0, fname);
}