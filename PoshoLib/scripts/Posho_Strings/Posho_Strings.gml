// Deletes a substring from a string.
function string_remove(strng, substr) {
    return string_replace(strng, substr, EMPTY);
}

// Returns the position the last char of a string is found at.
// Returns 0 if not found at all.
function string_char_at_last(strng, char) {
    for (var i=str_size(strng); i>0; i--)
        if (char_at(strng, i) == char)
            break;
    return i;
}