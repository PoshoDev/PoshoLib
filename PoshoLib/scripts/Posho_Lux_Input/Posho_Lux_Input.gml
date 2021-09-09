function Posho_Lux_Input(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    value = EMPTY;
    def = EMPTY;
    
    cursor = cr_beam;
    
    color = cl_black;
    color_def = cl_gray;
    
    usable = true;
    owner = NULL;
    
    sprite = spr_posho_lux_input_long;
    w = spr_w(sprite);
    h = spr_h(sprite)>string_height(text) ? spr_h(sprite) : string_height(text);
    
    sep = 4;
    
    native = function()
    {
        if (usable)
        {
            value = get_string(text, value);
            if (owner != NULL)
                owner.value = value;
        }
    }
    
    
    draw_gui = function()
    {
        draw_sprite(sprite, hover, x, y);
        
        if (value!=NULL || def!=NULL)
        {
            draw_set_color(value!=EMPTY ? color : color_def);
            draw_text_region(x+sep, y+sep, w-sep*2, h-sep*2,
                            value!=EMPTY ? value : def);
            draw_reset(true);
        }
        
        lux_debug();
    }
}