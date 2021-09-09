#macro elif else if     // For those Pythonesque folks.

#macro HALT if (false)  // Ignore a block of code!

#macro lol  say("lol"); // The legendary debugging assistant.
#macro lel  say("lel");
#macro lul  say("lul");
#macro lal  say("lal");
#macro lil  say("lil");


// iter : basically a simple for loop that uses i if no secondary parameter is given


// Text
#macro text_reset   {text_l; text_t;}

#macro text_l       draw_set_halign(fa_left);
#macro text_c       draw_set_halign(fa_center);
#macro text_r       draw_set_halign(fa_right);

#macro text_t       draw_set_valign(fa_top);
#macro text_m       draw_set_valign(fa_middle);
#macro text_b       draw_set_valign(fa_bottom);
