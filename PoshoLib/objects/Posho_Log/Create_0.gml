
globalvar log;
log = self;

data = dsl_create();

visible = true;
depth = -9001;

capacity = 8;
added = 0;

slot_w = 360;
slot_h = 24;
off = 4;
height = 0;
opacity = 0.85;


add = function(str)
{
    if (added >= capacity)
        dsl_delete(data, 0);
    else
    {
        added++;
        height = added * slot_h;
    }
        
    dsl_add(data, str);
}
