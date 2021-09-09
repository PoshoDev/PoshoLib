/// Instances
function inst(obj) {
    return instance_create_depth(0, 0, 1, obj);
}

// Creates an instance if it doesn't exist and returns its id.
// Returns the existing one if it already exists.
function inst_one(obj) {
    if (!instance_exists(obj))
        return inst(obj);
    else return instance_find(obj, 0);
}

function inst_destroy(obj) {
    if (instance_exists(obj))
        with (obj) { instance_destroy(); }
}

// If an instance exists, deletes ALL and returns a newly created one.
// Returns NULL if there wasn't one in the first place.
function inst_replace(obj) {
    if (instance_exists(obj)){
        with (obj) { instance_destroy(); }
        return inst(obj);
    }
    return NULL;
}

function inst_forceone(obj) {
    inst_destroy(obj);
    return inst(obj);
}