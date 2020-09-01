/// @desc   Initializes delta for time use.
function delta_set()
{
    globalvar delta;
    delta = 0;
    
    delta_update();
}


/// @desc   Updates delta.
function delta_update()
{
    delta = delta_time / 1000000 * room_speed;
}


/// @desc   Turns an integer into seconds.
/// @return Seconds.
function seconds(secs)
{
    return secs * delta;
}