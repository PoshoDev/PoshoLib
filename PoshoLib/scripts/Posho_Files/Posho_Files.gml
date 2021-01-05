// Returns the directory of a filename.
function directory_get(fname)
{
    while (string_char_at(fname, string_length(fname)) != "\\")
        fname = string_delete(fname, string_length(fname), 1);
    return fname;
}


// Creates a folder inside a directory, given the name.
// Returns the new directory.
function directory_make(dir, folder)
{
    var newdir = dir + folder + "\\";
    if (!directory_exists(newdir))
        directory_create(newdir);
    return newdir;
}


// Returns a DS List containing the names of all files in a directory with a
// given extension.
function directory_list_ext(dir, ext)
{
    var list = dsl_create();
    var file = file_find_first(dir+"*"+ext, 0);
    while (file != EMPTY)
    {
        dsl_add(list, file);
        say(file);
        file = file_find_next();
    }
    file_find_close();
    return list;
}


// Returns a DS List containing the names of all folders in a directory.
function directory_list_folders(dir)
{
    var list = dsl_create();
    var file = file_find_first(dir+"*", fa_directory);
    while (file != EMPTY)
    {
        if (!string_pos(".", file))
        {
            dsl_add(list, file);
            say(file);
        }
        file = file_find_next();
    }
    file_find_close();
    return list;
}


// Returns filename of a given string and removes the extension.
function filename_get(fname)
{
    var text = string_replace(fname, directory_get(fname), "");
    var pos = string_pos(".", text);
    return string_delete(text, pos, string_length(text)-pos+1);
}


// A quicker way to save data into an INI.
function ini_write(fname, section, key, value)
{
    ini_open(fname);
        if (typeof(value) == "string")
            ini_write_string(section, key, value);
        else
            ini_write_real(section, key, value);
    ini_close();
}


// A quicker way to read strings from an INI.
function ini_read_s(fname, section, key, def)
{
    ini_open(fname);
        var res = ini_read_string(section, key, def);
    ini_close();
    return res;
}


// A quicker way to read reals from an INI.
function ini_read_r(fname, section, key, def)
{
    ini_open(fname);
        var res = ini_read_real(section, key, def);
    ini_close();
    return res;
}