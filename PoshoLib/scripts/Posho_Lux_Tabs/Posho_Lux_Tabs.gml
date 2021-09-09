function Posho_Lux_Tabs(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    tabs =      dsl_create();
    selected =  NULL;
    last =      NULL;
    
    active = true;
    
    
    sort = function()
    {
        var total = dsl_size(tabs);
        tw = w / total;
        for (var i=0; i<total; i++)
            dsl(tabs, i).set_space(x+tw*i, y, tw, h);
    }
    
    add = function(text_)
    {
        last = new Posho_Lux_Tabs_Single(x, y, text_);
        dsl_add(tabs, last);
        if (dsl_size(tabs) == 1)
            selected = 0;
        return last;
    }
    
    
    step = function()
    {
        if (active)
            for (var i=0; i<dsl_size(tabs); i++)
                dsl(tabs, i).step();
    }
    
    draw_gui = function()
    {
        if (active)
            for (var i=0; i<dsl_size(tabs); i++)
                dsl(tabs, i).draw_gui();
    }
}



function Posho_Lux_Tabs_Single(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    draw_gui = function()
    {
        draw_rect_col(x, y, w, h, color, false);
        draw_text_region(x, y, w, h, text);
    }
}