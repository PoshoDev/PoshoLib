function Posho_Lux_Button(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    sprite = spr_posho_lux_button_normal_gray;
    
    radx = 48;
    rady = 48;
    
    w = spr_w(sprite);
    h = spr_h(sprite);
    
    
    draw_gui = function()
    {
        if (sprite != NULL)
            draw_sprite(sprite, hover, x, y);
        else
            draw_roundr_plus(x, y, w, h, radx, rady, color, c_black, def_alpha);
        
        if (text != EMPTY)
        {
            //draw_set_font(font!=NULL ? font : fnt_acumin);
            draw_set_color(color!=NULL ? color : cl_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(x+w/2, y+h/2, text);
            
            draw_reset(true);
        }
    }
}
