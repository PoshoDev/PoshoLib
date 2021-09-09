
// Reference to the main container, although you can have more.
objects = new Posho_Container();

containers = dsl_create();
dsl_add(containers, objects)


add = function()
{
    var newcont = new Posho_Container();
    dsl_add(containers, newcont);
    return newcont;
}
