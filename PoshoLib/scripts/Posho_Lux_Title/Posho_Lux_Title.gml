function Posho_Lux_Title(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    font = draw_get_font();
    color = cl_white;
    cursor = cr_default;
    w = string_width(text);
    h = string_height(text);
    
    
    draw_gui = function()
    {
        draw_set_color(color);
        draw_set_font(font);
        draw_text(x, y, text);
        
        draw_reset(true);
        
        lux_debug();
    }
}