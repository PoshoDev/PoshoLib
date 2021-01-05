/// @desc	Macros I use for shortening a bunch of GML variables and functions.

// Constants
#macro NULL -1
#macro EMPTY ""


// Variables
#macro g	global
	
#macro rw	room_width
#macro rh	room_height

#macro arg	argument
#macro argc	argument_count


// String Functions
#macro str	string

// Keyboard
#macro key			keyboard_check
#macro key_press	keyboard_check_pressed
#macro key_release	keyboard_check_released

// Mouse
#macro mbutton			mouse_check_button
#macro mbutton_press	mouse_check_button_pressed
#macro mbutton_release	mouse_check_button_released

// DS Lists
#macro dsl			ds_list_find_value
#macro dsl_create	ds_list_create
#macro dsl_add		ds_list_add
#macro dsl_delete	ds_list_delete
#macro dsl_size		ds_list_size
#macro dsl_value	ds_list_find_value
#macro dsl_index	ds_list_find_index