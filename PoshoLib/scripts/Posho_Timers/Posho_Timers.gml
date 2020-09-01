/// @desc   Initializes a timer container and saves as a local variable.
function timer_init()
{
    timer = ds_list_create();
}


/// @desc   Starts a timer.
/// @param	secs	The time in seconds.
function timer_set(secs)
{
    dsl_add(timer, seconds(secs));
}