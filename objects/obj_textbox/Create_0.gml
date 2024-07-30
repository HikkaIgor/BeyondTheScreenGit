depth = -9999


textbox_width = 320;
textbox_height = 100;
border = 8;
line_sep = 18;
line_width = textbox_width - border*2;
txtb_img = 0;
txtb_img_spd = 1/60;



page = 0;
page_number = 0;
text[0] = "";
text_lenght[0] = string_length(text[0]);

char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char = 0;
text_speed = 0.8;

option[0] = "";
option_link_id[0] = -1;
option_position = 0;
option_number = 0;

setup = false;


//sound
snd_delay = 4;
snd_count = snd_delay;


//effects
scr_set_default_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;

