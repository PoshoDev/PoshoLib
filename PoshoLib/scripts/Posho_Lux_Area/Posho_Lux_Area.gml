function Posho_Lux_Area(x_, y_, w_, h_, align_h_, align_v_, vertical_, sep_) constructor
{
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    align_h = align_h_;
    align_v = align_v_;
    
    vertical = vertical_;   // Is the sorting vertical?
    
    sep = sep_;
    color = NULL;
    
    container = new Posho_Container();
    
    action = NULL;
    
    active = true;
    debug = false;
    
    
    /// EVENTS
    
    step_begin = function()
    { 
        if (active)
            container.step_begin();
    }
    
    step = function()
    { 
        if (active)
            container.step();
    }
    
    draw = function()
    {
        container.draw();
    }
    
    draw_gui = function()
    {
        if (active)
        {
            if (color != NULL)
                draw_rect_col(x, y, w, h, color, false);
                
            container.draw_gui();
            
            if (debug)
                draw_rectangle(x, y, x+w, y+h, true);
        }
    }
    
    
    /// FUNCTIONS
    
    add = function(item_)
    {
        return container.add(item_);
    }
    
    clear = function()
    {
        container.clear();
    }
    
    // Orders your items vertically.
    // NOTE: Currently only works for Middle-Center.
    pile = function()
    {
        // First, figure out where to start
        var stx = set_stx();
        var sty = set_sty();
        
        // Then we actually pile them.
        var plus_x = 0;
        var plus_y = 0;
        for (var i=0; i<dsl_size(container.list); i++)
        {
            var curr = dsl(container.list, i);
            
            // Sort Mode
            if (vertical)
            {
                switch(align_h)
                {
                    case fa_left:   curr.x = x;              break;
                    case fa_center: curr.x = stx - curr.w/2; break;
                    case fa_right:  curr.x = x+w - curr.w;   break;
                }
                curr.y = sty + plus_y;
                plus_y += curr.h + sep;
            }
            else
            {
                if (align_h == fa_left)
                    curr.x = stx + plus_x;
                else if (align_h == fa_right)
                    curr.x = stx - plus_x - curr.w;
                curr.y = y+h/2 - curr.h/2;
                plus_x += curr.w + sep;
            }
        }
        
        // Then We Make The Children Pile As Well!
        for (var i=0; i<dsl_size(container.list); i++)
            if (variable_instance_get(dsl(container.list, i), "pile"))
                dsl(container.list, i).pile();
    }
    
    
    /// YOU PROBABLY DON'T WANT TO EVER USE THESE.
    
    //Returns the measurement of all elements piled together.
    measure = function()
    {
        var tot = 0;
        for (var i=0; i<dsl_size(container.list); i++)
        {
            var curr = dsl(container.list, i);
            tot += sep + (vertical ? curr.h : curr.w);
        }
        return tot - sep;
    }
    
    set_stx = function()
    {
        switch(align_h)
        {
            case fa_left:   return x;       break;
            case fa_center: return x + w/2; break;
            case fa_right:  return x+w;     break;
        }
    }
    
    set_sty = function()
    {
        switch(align_v)
        {
            case fa_top:    return y;                       break;
            case fa_middle: return y+h/2 - measure(true)/2; break;
            case fa_bottom: return y+w;                     break;
        }
    }

}
