function odd(number) {
    if ((number % 2))
        return false;
    return true;
}

function even(number) {
    return !odd(number);
}

// Tells how many times a rect fits inside inside another rect.
// Returns rows and cols.
function fit_rect_in_rect() {
}

// Sets a variable between a given range.
function value_regulate(val, minimum, maximum) {
    if (val < minimum)
        return minimum;
    if (val > maximum)
        return maximum;
    return val;
}

// Gets the percent (0-100) of a value inside another.
// Don't judge, I sometimes forget stuff as simple as this...
function value_percent(val1, val2) {
    return val1 / val2 * 100;
}

function iter_loop(current, limit) {
    return current < limit-1 ? current+1 : 0;
}