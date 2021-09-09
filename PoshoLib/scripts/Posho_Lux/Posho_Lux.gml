enum PoshoLuxHover  { disabled, normal, hover, pressed };

function Posho_Lux(x_, y_, text_/*, area/container*/) constructor {
    text = text_;
    
    x = x_;
    y = y_;
    
    if (argc > 3)
        arg[3].add(self);
    
    w = 128;
    h = 64;
    
    hover =  PoshoLuxHover.normal;
    cursor = cr_handpoint;
    
    sprite = NULL;
    
    action = NULL;
    native = NULL;
    
    font =   NULL;
    color =  NULL;
    
    debug = false;
    
    
    step = function() {
        var mouse_in = point_in_rectangle(win_mx(), win_my(), x, y, x+w, y+h);
        
        switch(hover) {
            case PoshoLuxHover.normal:
                if (mouse_in) {
                    hover = PoshoLuxHover.hover;
                    window_set_cursor(cursor);
                }
            break;
            
            case PoshoLuxHover.hover:
                if (mouse_in) {
                    if (mbutton_press(mb_left))
                        hover = PoshoLuxHover.pressed;
                }
                else {
                    hover = PoshoLuxHover.normal;
                    window_set_cursor(cr_default);
                }
            break;
            
            case PoshoLuxHover.pressed:
                if (mbutton_release(mb_left)) {
                    if (mouse_in) {
                        if (native != NULL)
                            native();
                        if (action != NULL)
                            action();
                        hover = PoshoLuxHover.hover;
                    }
                    else {
                        hover = PoshoLuxHover.normal;
                        window_set_cursor(cr_default);
                    }
                }
            break;
        }
    }
    
    
    /// FUNCTIONS
    
    sprite_set = function(spr_) {
        sprite = spr_;
        w = spr_w(sprite);
        h = spr_h(sprite);
    }
    
    
    set_pos = function(x_, y_) {
        x = x_;
        y = y_;
    }
    
    set_size = function(w_, h_) {
        w = w_;
        h = h_;
    }
    
    set_space = function(x_, y_, w_, h_) {
        set_pos(x_, y_);
        set_size(w_, h_);
    }
}
