function draw_reset()
{
    draw_set_color(def_blend);
    
    // Optional: Hard Reset?
    if (argument_count>0 && argument[0])
    {
        draw_set_alpha(def_alpha);
        
        draw_set_halign(def_halign);
        draw_set_valign(def_valign);
    }
}