function Posho_Lux_Finder(x_, y_, text_) :
Posho_Lux_Area(x_, y_, 0, 0, fa_left, fa_middle, false, 8) constructor
{
    value = EMPTY;
    
    input = new Posho_Lux_Input(0, 0, "");
    input.owner = self;
    add(input);
    
    button = new Posho_Lux_Button(0, 0, text_);
    button.owner = self;
    button.sprite_set(spr_posho_lux_button_mini_gray);
    button.native = function()
    {
        value = file_prompt_open("", ".png");
        input.value = value;
        if (action != NULL)
            action();
    }
    add(button);
    
    w = input.w + sep + button.w;
    h = input.h > button.h ? input.h : button.h;
    
    pile();
    
    
    value_set = function(val)
    {
        value = val;
        input.value = val;
    }
}