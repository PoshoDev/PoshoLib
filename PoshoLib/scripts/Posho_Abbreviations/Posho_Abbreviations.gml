/// @desc	Macros I use for shortening a bunch of GML variables and functions.

// Constants
#macro NULL				-1
#macro EMPTY			""

#macro uc_A				65
#macro uc_Z				90
#macro uc_a				97
#macro uc_z				122


// Variables
#macro g				global
#macro gv				globalvar
	
#macro rw				room_width
#macro rh				room_height
#macro rc				rw / 2
#macro rm				rh / 2

#macro arg				argument
#macro argc				argument_count

#macro wd				working_directory

#macro mx				mouse_x
#macro my				mouse_y

#macro ib				image_blend
#macro ia				image_alpha
#macro ir				image_angle
#macro is				image_speed
#macro in				image_number


// String
#macro str				string
#macro str_size			string_length
#macro str_remove		string_remove
#macro char_at			string_char_at
#macro char_last		string_char_at_last

// Reals
#macro int				real

// Sprite
#macro spr_w			sprite_get_width
#macro spr_h			sprite_get_height
#macro spr_exists		sprite_exists

// Keyboard
#macro key_check		keyboard_check
#macro key_press		keyboard_check_pressed
#macro key_release		keyboard_check_released

#macro vk_minus	109
#macro vk_plus 	107

// Mouse
#macro mbutton			mouse_check_button
#macro mbutton_press	mouse_check_button_pressed
#macro mbutton_release	mouse_check_button_released

// Window
#macro ww				window_get_width
#macro wh				window_get_height
#macro wc				ww / 2
#macro wm				wh / 2
#macro win_mx			window_mouse_get_x
#macro win_my			window_mouse_get_y

// Arrays
#macro arr_len			array_length

// DS Lists
#macro dsl				ds_list_find_value
#macro dsl_create		ds_list_create
#macro dsl_clear		ds_list_clear
#macro dsl_add			ds_list_add
#macro dsl_delete		ds_list_delete
#macro dsl_size			ds_list_size
#macro dsl_value		ds_list_find_value
#macro dsl_index		ds_list_find_index
#macro dsl_empty		ds_list_empty
#macro dsl_destroy		ds_list_destroy

// DS Grids
#macro dsg				ds_grid_get
#macro dsg_create		ds_grid_create
#macro dsg_set			ds_grid_set
#macro dsg_w			ds_grid_width
#macro dsg_h			ds_grid_height

// DS Maps
#macro dsm				ds_map_find_value
#macro dsm_create		ds_map_create

// Extensions
#macro INI				".ini"
#macro TXT				".txt"
#macro CSV				".csv"
#macro PNG				".png"
#macro JPG				".jpg"
#macro JSON				".json"

#macro _ini				+ INI
#macro _txt				+ TXT
#macro _csv				+ CSV
#macro _png				+ PNG
#macro _jpg				+ JPG
#macro _json			+ JSON
