function Posho_Lux_Checkbox(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    value = false;
    
    sprite_false = spr_posho_lux_checkbox_false;
    sprite_true = spr_posho_lux_checkbox_true;
    sprite = sprite_false;
    
    font = draw_get_font();
    color = cl_white;
    
    sep = 8;
    
    w = spr_w(sprite) + sep + string_width(text);
    h = spr_h(sprite)>string_height(text) ? spr_h(sprite) : string_height(text);
    
    
    native = function()
    {
        value = !value;
    }
    
    
    draw_gui = function()
    {
        sprite = value ? sprite_true : sprite_false;
        draw_sprite(sprite, hover, x, y);
        
        if (text != NULL)
        {
            draw_set_color(color);
            draw_set_valign(fa_middle);
            draw_text(x+spr_w(sprite)+sep, y+h/2, text);
            
            draw_reset(true);
        }
        
        lux_debug();
    }
}