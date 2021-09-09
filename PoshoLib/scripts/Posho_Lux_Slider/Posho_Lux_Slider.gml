function Posho_Lux_Slider(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    minimum = 0;
    maximum = 100;
    
    sprite = spr_posho_lux_slider_bar_gray;
    
    w = spr_w(sprite);
    
    button = new Posho_Lux_Slider_Button(x, y, "");
    button.slider = self;
    
    h = spr_h(button.sprite);
    
    position_set = function(val)
    {
        if (val < minimum)
            val = minimum;
        else if (val > maximum)
            val = maximum;
        value = val;
        button.x = x + w/2 - spr_h(sprite)/2;
        input.value = value;
        if (action != NULL)
            action();
    }
    
    input = new Posho_Lux_Input(x+w+8, y, "")
    input.sprite = spr_posho_lux_input_small;
    input.w = spr_w(input.sprite);
    input.action = function() { position_set(input.value) };
    input.slider = self;
    
    value = 50;
    position_set(value);
    
    
    step_begin = function()
    {
        button.step();
        input.step();
        
        input.x = x + w + 8;
        input.y = y;
        
        if (hover==PoshoLuxHover.pressed
        || button.hover==PoshoLuxHover.pressed)
        {
            var edx = x + w;
            
            if (mx < x)
                button.x = x;
            else if (mx > edx)
                button.x = edx;
            else
                button.x = mx;
            
            value = floor((button.x-x) / (edx-x) * maximum);
            input.value = value;
            if (action != NULL)
            action();
        }
    }
    
    
    draw_gui = function()
    {
        draw_sprite(sprite, hover, x, y+spr_h(button.sprite)/2);
        button.draw_gui();
        input.draw_gui();
        
        lux_debug();
    }
}


function Posho_Lux_Slider_Button(x_, y_, text_) :
Posho_Lux(x_, y_, text_) constructor
{
    slider = NULL;
    
    sprite = spr_posho_lux_slider_button_green;
    
    w = spr_w(sprite);
    h = spr_h(sprite);
    
    
    draw_gui = function()
    {
        draw_sprite(sprite, hover, x-w/2, slider.y);
    }
}
