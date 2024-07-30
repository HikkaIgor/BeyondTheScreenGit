accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"));
down_key = keyboard_check_pressed(vk_down) ||  keyboard_check_pressed(ord("S"));
up_key =  keyboard_check_pressed(vk_up) ||  keyboard_check_pressed(ord("W"));

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0])+280;

if setup == false
{
    setup = true;
    draw_set_font(fnt_shakyhands_dialogue);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    for (var p = 0; p < page_number; p++)
    {
        text_lenght[p] = string_length(text[p]);
        
        // Default to left side
        text_x_offset[p] = 160;
        portrait_x_offset[p] = 32;
        
        // Adjust for right side speaker
        if speaker_side[p] == -1
        {
            text_x_offset[p] = 32;
            portrait_x_offset[p] = 384;
        }
        
        // No speaker
        if speaker_spr[p] == noone
        {
            text_x_offset[p] = 96;
        }
        
        last_free_space = 0; // Initialize last free space
        line_break_offset[p] = 0; // Initialize line break offset
        line_break_num[p] = 0; // Initialize line break number

        for (var c = 0; c < text_lenght[p]; c++)
        {
            var _char_pos = c + 1;
            char[c,p] = string_char_at(text[p], _char_pos); 
            
            var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
            var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);

            if (char[c,p] == " ") { last_free_space = _char_pos; }

            if (_current_txt_w - line_break_offset[p] > line_width)
            {
                line_break_pos[line_break_num[p], p] = last_free_space;
                line_break_num[p]++;
                var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
                var _last_free_space_string = string_char_at(text[p], last_free_space);
                line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
            }
        }
        
        for (var c = 0; c < text_lenght[p]; c++)
        {
            var _char_pos = c + 1;
            var _txt_x = textbox_x + text_x_offset[p] + border;
            var _txt_y = textbox_y + border;

            var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
            var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p]);
            var _txt_line = 0;

            for (var lb = 0; lb < line_break_num[p]; lb++)
            {
                if (_char_pos >= line_break_pos[lb, p])
                {
                    var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
                    _current_txt_w = string_width(_str_copy);
                    _txt_line = lb + 1;    
                }
            }

            char_x[c, p] = _txt_x + _current_txt_w;
            char_y[c, p] = _txt_y + _txt_line * line_sep;
        }
    }
}

if text_pause_timer <= 0
	{
		if draw_char < text_lenght[page]
		{
		    draw_char += text_speed;
		    draw_char = clamp(draw_char, 0, text_lenght[page]);
			var _check_char = string_char_at(text[page],draw_char);
			if _check_char == "." || _check_char == "?" || _check_char == "!"  
				{
					text_pause_timer = text_pause_time;
					if !audio_is_playing(snd[page]){
						audio_play_sound(snd[page],8,false)
					}
					
				}
			else
				{
					if snd_count < snd_delay {
					snd_count++;
					} else{
						snd_count = 0;
						audio_play_sound(snd[page],8,false)
					}
				}
			
		}
	}
	else 
	{
		text_pause_timer--;
	}
if accept_key 
{
	
	//if the typing is done
    if draw_char == text_lenght[page]	
    {
		
		//next page
        if page < page_number - 1
        {
			
            page++;
            draw_char = 0;
        }
		//destroy textbox
        else 
        {
            if option_number > 0
            {
				obj_SFX.selectSnd = true;
                create_textbox(option_link_id[option_position]);
            }
            instance_destroy();
        }
    }
	
}

var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

if speaker_spr[page] != noone
{
    sprite_index = speaker_spr[page];
    if draw_char == text_lenght[page] { image_index = 0; }
    var _speaker_x = textbox_x + portrait_x_offset[page];
    if speaker_side[page] == -1
    {
        _speaker_x += sprite_width;
    }
    // Draw speaker
    draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width / txtb_spr_w, sprite_height / txtb_spr_h, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}

draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, c_white, 1);

if draw_char == text_lenght[page] && page == page_number - 1
{
    option_position += down_key - up_key;
    option_position = clamp(option_position, 0, option_number - 1);
    
    var _op_space = 40;
    var _op_bord = 60;
    for (var op = 0; op < option_number; op++)
    {
        // Option box
        var _o_w = string_width(option[op]) + _op_bord;
        draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 32, _txtb_y - _op_space * option_number + _op_space * op, _o_w / txtb_spr_w, (_op_space - 1) / txtb_spr_h, 0, c_white, 1);
        
        // Arrow
        if (option_position == op)
        {
            draw_sprite_ext(spr_textbox_arrow, 0, _txtb_x-10, _txtb_y - _op_space * option_number + _op_space * op - 5,0.7,0.7,0,c_white,1);
        }
        
        // Option text
        draw_text_color(_txtb_x + _op_bord, _txtb_y - _op_space * option_number + _op_space * op, option[op],c_white,c_white,c_white,c_white,1);
    }
}

for (var c = 0; c < draw_char; c++)
{
	//special stuff
	//wavy text
	var _float_y = 0;
	if float_text[c,page] == true
	{
		float_dir[c,page] += -6;
		_float_y = dsin(float_dir[c,page])*2;
	}
	
	//shake text
	var _shake_x = 0;
	var _shake_y = 0;
	if shake_text[c,page] == true
		{
			shake_timer[c,page]--;
			if shake_timer[c,page] <= 0
			{
				shake_timer[c,page] = irandom_range(2,4);
				shake_dir[c,page] = irandom(360);
			}
		_shake_x = lengthdir_x(1,shake_dir[c,page])
		_shake_y = lengthdir_y(1,shake_dir[c,page])
		}
	//the text
    draw_text_color(char_x[c, page]+_shake_x, char_y[c, page]+_float_y+_shake_y-10, char[c, page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1);
}
