/// Posho Boite

enum PoshoBoiteType { item, dir, func };

// Kind of the container of items.
function Posho_Boite(x_, y_, w_, h_) constructor
{
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    items =   dsl_create();
    
    action = NULL;
    
    parent = NULL;
    child =  NULL;
    
    active = false;
    pos = 0;
    size = 0;
    
    col_back = cl_black;
    col_font = cl_white;
    alpha_back = 0.85;
    
    off = 8;
    sep = 16;
    rad = 8;
    
    
    step = function()
    {
        if (child != NULL)
            child.step();
            
        if (active)
        {
            if (key_press(vk_down) || mouse_wheel_down())
            {
                if (pos < size-1)
                    pos++;
            }
            else if (key_press(vk_up) || mouse_wheel_up())
            {
                if (pos > 0)
                    pos--;
            }
            else if (mbutton_press(mb_right))
            {
                selected = get_selected();
                if (selected.action != NULL) // If Item has Action
                    selected.action();
                else if (action!=NULL) // General
                    action();
            }
            else if (key_press(vk_escape) || mbutton_press(mb_middle))
            {
                if (parent != NULL)
                {
                    parent.active = true;
                    parent.child = NULL;
                }
            }
        }
    }
    
    
    draw_gui = function()
    {
        if (child != NULL)
            child.draw_gui();
            
        if (size > 0)
        {
            // Background
            draw_roundr_plus(x, y, w, h, rad, rad, col_back, col_font, alpha_back);
            
            // Items
            for (var i=0; i<size; i++)
            {
                if (pos == i)
                {
                    draw_roundr_col(x+off/2, y+sep*i, w-off, sep, rad, rad, col_font, false);
                    
                    // Description
                    if (active && dsl(items, i).description!=EMPTY)
                    {
                        draw_roundr_plus(x+w+off/2, y+sep*i, w-off, sep, rad, rad, col_back, col_font, alpha_back);
                        
                        draw_set_color(col_font);
                        draw_text(x+w+off, y+sep*i, dsl(items, i).description);
                    }
                }
                    
                draw_set_color(pos==i ? col_back : col_font);
                draw_text(x+off, y+sep*i, dsl(items, i).title);
            }
        }
        else
            draw_text(x+off, y, "(Empty)");
            
        draw_reset();
    }
    
    
    add = function(title_)
    {
        var item = new Posho_Boite_Item(title_, // Title
        argc>1 ? arg[1] : PoshoBoiteType.item,  // Type
        argc>2 ? arg[2] : EMPTY,                // Description
        argc>3 ? arg[3] : NULL,                 // Icon
        argc>4 ? arg[4] : NULL,                 // Content
        argc>5 ? arg[5] : NULL);                // Action
        
        dsl_add(items, item);
        size++;
    }
    
    
    resize = function()
    {
        var biggest = 0;
        
        for (var i=0; i<size; i++)
        {
            var count = string_length(dsl(items, i).title);
            if (count > biggest)
                biggest = count;
        }
        
        w = 12 * biggest + off;
        h = size * sep + off;
    }
    
    
    spread = function()
    {
        child = new Posho_Boite(x+w+off, y, w, h);
        child.parent = self;
        
        active = false;
        child.active = true;
    }
    
    
    // Returns the selected object.
    get_selected = function()
    {
        return dsl(items, pos);
    }
}


// A Boite Item!
function Posho_Boite_Item(title_, type_, desc_, icon_, content_, action_) constructor
{
    title = title_;         // The name on the list.
    type = type_;           // Type of item.
    description = desc_;    // Something to describe it, I guess.
    icon = icon_;           // Small icon to draw next to it.
    content = content_;     // Variable where it holds valuable data!
    action = action_;       // Function that will be called when pressed.
}
