function Posho_Lux_Graphic(x_, y_, spr_) :
Posho_Lux(x_, y_, EMPTY) constructor
{
    sprite = spr_;
    index = 0;
    w = spr_w(sprite);
    h = spr_h(sprite);
    scale = 1;
    
    cursor = cr_default;
    active = true;
    
    
    draw_gui = function()
    {
        if (active)
            draw_sprite_scale(sprite, index, x, y, scale);
        
        if (debug)
            draw_rect_col(x, y, w, h, c_red, true);
    }
}