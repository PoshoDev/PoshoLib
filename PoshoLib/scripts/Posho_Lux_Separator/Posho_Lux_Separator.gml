function Posho_Lux_Separator(x_, y_, h_) :
Posho_Lux(x_, y_, "") constructor
{
    w = h_;
    h = h_;
    cursor = cr_default;
    
    draw_gui = function()
    {
        lux_debug();
    }
}