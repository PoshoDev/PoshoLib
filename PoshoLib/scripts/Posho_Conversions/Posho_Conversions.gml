function array_to_dslist(array) {
    var list = dsl_create();
    for (var i=0; i<arr_len(array); i++)
        dsl_add(list, array[i]);
    return list;
}

function dslist_to_array(list) {
    var array = [];
    for (var i=0; i<dsl_size(list); i++)
        array[i] = dsl(list, i);
    return array;
}
