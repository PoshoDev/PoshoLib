function Posho_Resizer() constructor
{
    action = NULL; // Need a script done upon resizing?
    
    
    step = function()
    {
        // Checks if the window changed.
        if ((rw!=ww() || rh!=wh()) && (ww()>2 || wh()>2))
            window_resize(action);
    }
    
    
    window_resize = function()
    {
        rw = ww();
        rh = wh();
        
        surface_resize(application_surface, rw, rh);
        
        if (action != NULL)
            action();
    }
}