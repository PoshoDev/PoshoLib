enum But { idle, hover, pressed };

function button_check_mouse(x, y, w, h, state) {
    if (mouse_in_rectangle(x, y, w, h)) {
        if (state==But.hover && mbutton_press(mb_left))
                return But.pressed;
        else if (state==But.pressed && (mbutton_release(mb_left)))
                return But.idle;
        else if (state==But.idle)
            return But.hover;
    }
    else if (!mbutton_press(mb_left))
        return But.idle;
    return state;
}