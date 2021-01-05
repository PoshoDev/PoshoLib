function draw_reset()
{
    draw_set_color(c_white);
    
    // Optional: Hard Reset?
    if (argument_count>0 && argument[0])
    {
        draw_set_alpha(1);
    }
}