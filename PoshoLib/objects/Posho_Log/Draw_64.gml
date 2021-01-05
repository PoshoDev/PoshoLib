
var sty = rh - off - height;

for (var i=0; i<added; i++)
{
    draw_set_alpha(opacity);
    draw_set_color((even(i) ? cl_black : cl_black_light));
    draw_rectangle(off, sty+slot_h*i, slot_w+off, sty+slot_h*(i+1), false);
    
    draw_set_alpha(1);
    draw_set_color(cl_white);
    draw_rectangle(off, sty+slot_h*i, slot_w+off, sty+slot_h*(i+1), true);
    
    draw_text(off*2, sty+slot_h*i, dsl(data, i));
}

draw_reset();
