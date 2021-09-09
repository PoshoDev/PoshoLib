// Returns the directory of a filename.
function directory_get(fname) {
    while (string_char_at(fname, string_length(fname)) != "\\")
        fname = string_delete(fname, string_length(fname), 1);
    return fname;
}

// Prompts the user to create a directory, then returns the new directory.
function directory_prompt_save(def, ext) {
    var name = file_prompt_save(def, ext);
    if (name != EMPTY) {
        var dir = directory_get(name);
        var tit = file_get_name(name);
        return directory_make(dir, tit);
    }
    return EMPTY;
}

// Creates a folder inside a directory, given the name.
// Returns the new directory.
function directory_make(dir, folder) {
    var newdir = dir + folder + "\\";
    if (!directory_exists(newdir))
        directory_create(newdir);
    return newdir;
}

// Returns a DS List containing the names of all files in a directory with a
// given extension.
function directory_list_ext(dir, ext) {
    var list = dsl_create();
    var file = file_find_first(dir+"*"+ext, 0);
    while (file != EMPTY) {
        dsl_add(list, file);
        file = file_find_next();
    }
    file_find_close();
    return list;
}

// Returns a DS List containing the names of all folders in a directory.
function directory_list_folders(dir) {
    var list = dsl_create();
    var file = file_find_first(dir+"*", fa_directory);
    while (file != EMPTY) {
        if (!string_pos(".", file)) {
            dsl_add(list, file);
            say(file);
        }
        file = file_find_next();
    }
    file_find_close();
    return list;
}

// Just makes a file and returns its filename.
function file_make(dir, fname) {
    if (directory_exists(dir))
        if (!file_exists(dir+fname)) {
            var fle = file_text_open_write(dir+fname);
                file_text_write_string(fle, "\n");
            file_text_close(fle);
        }
        return dir + fname;
    return EMPTY;
}

// Moves a file to a given directory.
function file_move(fname, dest) {
    if (file_exists(fname) && directory_exists(dest)) {
        file_copy(fname, dest + file_get_filename(fname));
        file_delete(fname);
    }
    elif (ERRORS_FILES)
		say(errFILES "Trying to move non-existent file: "+fname);
}

// Retrurns the filename of a given string WITH the extension.
function file_get_filename(fname) {
    return string_remove(fname, directory_get(fname));
}

// Returns filename of a given string and removes the extension.
function file_get_name(fname) {
    var text = file_get_filename(fname);
    var pos = string_pos(".", text);
    return string_delete(text, pos, string_length(text)-pos+1);
}

// Prompts the user to load a file and returns it.
function file_prompt_open(def, ext) {
    var fname = get_open_filename(def+"|*"+ext, "");
    return fname;
}

// Prompts the user to save a file and returns it.
function file_prompt_save(def, ext) {
    var fname = EMPTY;
    fname = get_save_filename("."+ext+"|*."+ext, def);
    return fname;
}

// A quicker way to save data into an INI.
function ini_write(fname, section, key, value) {
    ini_open(fname);
        if (typeof(value) == "string")
            ini_write_string(section, key, value);
        else
            ini_write_real(section, key, value);
    ini_close();
}

// A quicker way to read strings from an INI.
function ini_read_s(fname, section, key, def) {
    ini_open(fname);
        var res = ini_read_string(section, key, def);
    ini_close();
    return res;
}

// A quicker way to read reals from an INI.
function ini_read_r(fname, section, key, def) {
    ini_open(fname);
        var res = ini_read_real(section, key, def);
    ini_close();
    return res;
}

// Replaces section if it exists, then creates keys as: [key]+'_'+[i].
function ini_write_list(fname, section, key, def, list) {
    
}

function file_read_s(fname) {
    if (file_exists(fname)) {
        var file = file_text_open_read(fname);
            var val = file_text_read_string(file);
        file_text_close(file);
        return val;
    }
    return EMPTY;
}

function file_read_r(fname) {
    if (file_exists(fname)) {
        var file = file_text_open_read(fname);
            var val = file_text_read_real(file);
        file_text_close(file);
        return val;
    }
    return NULL;
}

function struct_save_secure(struct, filename) {
    var arr = array_create(0);
    array_push(arr, struct);
    var strr = base64_encode(json_stringify(arr));
    var buff = buffer_create(string_byte_length(strr)+1, buffer_fixed, 1);
    buffer_write(buff, buffer_string, strr);
    buffer_save(buff, filename);
    buffer_delete(buff);
}

function struct_load_secure(filename) {
    
}


function json_walk(argument0, argument1, argument2) {
	var _pos    = string_pos( ".", argument1 );
	var _key    = ( _pos > 0 ? string_copy( argument1, 1, _pos - 1 ) : argument1 );
	var _num    = string_digits( _key ) == _key;
	var _value;

	if ( _num ) {
	    _key    = real( _key );
	    _value    = ds_list_find_value( argument0, _key );
    
	} else {
	    _value    = ds_map_find_value( argument0, _key );
    
	}
	if ( is_undefined( _value ) ) {
	    return argument2;
    
	}
	if ( _pos == 0 ) {
	    return _value;
    
	}
	return json_walk( _value, string_delete( argument1, 1, _pos ), argument2 );


}
