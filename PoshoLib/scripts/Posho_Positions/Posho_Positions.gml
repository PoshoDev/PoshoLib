enum PoshoPosOrigin { TopLeft, TopCenter, TopRight,
                      MidLeft, MidCenter, MidRight,
                      BotLeft, BotCenter, BotRight };

// Gives a position, given two rectangles and origin (both rectangles' origins
// are on the top left). Returns a struct.
// Rect1 is the rectangle inside Rect2.
function position_align(r1x, r1y, r1w, r1h, r2x, r2y, r2w, r2h, ori)
{
    var ret;
    
    switch(ori)
    {
        case PoshoPosOrigin.TopLeft:
            ret[0] = r2x;
            ret[1] = r2y;
        break;
        
        case PoshoPosOrigin.MidCenter:
            ret[0] = r2x+r2w/2 - (r1x+r1w/2);
            ret[1] = r2y+r2h/2 - (r1y+r1h/2);
        break;
    }
    
    return ret;
}

function center(l1, l2) {
    return l2/2 - l1/2;
}

function center_spr_win_x(spr) {
    return center(spr_w(spr), ww);
}

function center_spr_win_y(spr) {
    return center(spr_h(spr), wh);
}

function center_spr_win(spr) {
    return new Vector2(center_spr_win_x(spr), center_spr_win_y(spr));
}