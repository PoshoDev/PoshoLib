/// @desc   An object manager. Dedicated to lightweight objects's game loops.
function Posho_Container() constructor
{
    list =              dsl_create();
    list_step_begin =   dsl_create();
    list_step =         dsl_create();
    list_draw =         dsl_create();
    list_draw_gui =     dsl_create();
    
    
    // FUNCTIONS
    
    // Adds an element to the container. If it contains an event, it gets added
    // to the list.
    add = function(obj)
    {
        dsl_add(list, obj);
        if (variable_instance_get(obj, "step_begin"))
            dsl_add(list_step_begin, obj);
        if (variable_instance_get(obj, "step"))
            dsl_add(list_step, obj);
        if (variable_instance_get(obj, "draw"))
            dsl_add(list_draw, obj);
        if (variable_instance_get(obj, "draw_gui"))
            dsl_add(list_draw_gui, obj);
        return obj;
    }
    
    
    // Empties the container entirely.
    clear = function()
    {
        dsl_clear(list);
        dsl_clear(list_step_begin);
        dsl_clear(list_step);
        dsl_clear(list_draw);
        dsl_clear(list_draw_gui);
    }
    
    
    size = function()
    {
        return dsl_size(list);
    }
    
    
    
    // EVENTS
    
    step_begin = function()
    {
        for (var i=0; i<dsl_size(list_step_begin); i++)
            dsl(list_step_begin, i).step_begin();
    }
    
    
    step = function()
    {
        for (var i=0; i<dsl_size(list_step); i++)
            dsl(list_step, i).step();
    }
    
    
    draw = function()
    {
        for (var i=0; i<dsl_size(list_draw); i++)
            dsl(list_draw, i).draw();
    }
    
    
    draw_gui = function()
    {
        for (var i=0; i<dsl_size(list_draw_gui); i++)
            dsl(list_draw_gui, i).draw_gui();
    }
}