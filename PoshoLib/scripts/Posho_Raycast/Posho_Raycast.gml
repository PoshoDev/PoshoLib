/// @desc   Checks if there's a collision between two points.
/// @param  x1  Point A's X.
/// @param  y1  Point A's Y.
/// @param  x2  Point B's X.
/// @param  y2  Point B's Y.
/// @param  obj The object you're looking a collision for.
/// @param  qua The quality of the check (0-1). The higher the slower.
/// @return Boolean.
function raycast_check(x1, y1, x2, y2, obj, qua)
{
    var found = false;
    var dir = point_direction(x1, y1, x2, y2);
    
    while (point_distance(x1, y1, x2, y2) > qua)
    {
        if (collision_point(x1, y1, obj, false, true))
            return true;
        
        x1 += lengthdir_x(qua, dir);
        y1 += lengthdir_y(qua, dir);
    }
    
    return false;
}


/// @desc   Checks if there's a collision between two points returning coords.
/// @param  x1  Point A's X.
/// @param  y1  Point A's Y.
/// @param  x2  Point B's X.
/// @param  y2  Point B's Y.
/// @param  obj The object you're looking a collision for.
/// @param  qua The quality of the check (0-1). The higher the slower.
/// @return A 2D array containing the coordenates [x, y].
function raycast_coord(x1, y1, x2, y2, obj, qua)
{
    var found = false;
    var dir = point_direction(x1, y1, x2, y2);
    
    while (point_distance(x1, y1, x2, y2) > qua)
    {
        if (collision_point(x1, y1, obj, false, true))
            break;
        
        var xp = x1;
        var yp = y1;
        
        x1 += lengthdir_x(qua, dir);
        y1 += lengthdir_y(qua, dir);
    }
    
    var pos;
    pos[0] = xp;
    pos[1] = yp;
    
    return pos;
}
