function say(str)
{
    show_debug_message(str);
    
    if (instance_exists(Posho_Log))
        log.add(str);
}