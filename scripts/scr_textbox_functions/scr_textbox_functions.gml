function scr_set_default_for_text()
{
	line_break_pos[0,page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//var for every letter/char
	for (var c =0; c < 500;c++)
	{
		col_1[c,page_number] = c_white;
		col_2[c,page_number] = c_white;
		col_3[c,page_number] = c_white;
		col_4[c,page_number] = c_white;
		
		float_text[c,page_number] = 0;
		float_dir[c,page_number] = c*20;
		
		shake_text[c,page_number] = 0;
		shake_dir[c,page_number] = irandom(360);
		shake_timer[c,page_number] = irandom(4);
	}
	
	
	txtb_spr[page_number] = spr_textbox_white;
	speaker_spr[page_number] = noone;
	speaker_side[page_number] = 1;
	
	snd[page_number] = snd_voice_child;
}


//text VFX

//text color
function scr_text_color(_start,_end,_col1,_col2,_col3,_col4){

for (var c = _start;c <= _end;c++)
{
	col_1[c,page_number-1] = _col1;
	col_2[c,page_number-1] = _col2;
	col_3[c,page_number-1] = _col3;
	col_4[c,page_number-1] = _col4;
}
	
}

//text float
function scr_text_float(_start,_end)
{

for (var c = _start;c <= _end;c++)
	{
		float_text[c,page_number-1] = true;
	}

}

function scr_text_shake(_start,_end)
{

for (var c = _start;c <= _end;c++)
	{
		shake_text[c,page_number-1] = true;
	}

}


function scr_text(_text){
	
	scr_set_default_for_text();
	
	text[page_number] = _text;
	
	//get char info
	if argument_count > 1 
	{
		
		switch(argument[1])
	{
		
		case "child":
		speaker_spr[page_number] = spr_child_portrait;
		txtb_spr[page_number] = spr_textbox_white;	
		snd[page_number] = snd_voice_child;
		break;
		case "child_happy":
		speaker_spr[page_number] = spr_child_portrait;
		txtb_spr[page_number] = spr_textbox_yellow;	
		snd[page_number] = snd_voice_child;
		break;
		case "child_angry":
		speaker_spr[page_number] = spr_child_portrait_angry;
		txtb_spr[page_number] = spr_textbox_red;
		snd[page_number] = snd_voice_child;
		break;
		case "child_sad":
		speaker_spr[page_number] = spr_child_portrait_sad;
		txtb_spr[page_number] = spr_textbox_blue;
		snd[page_number] = snd_voice_child;
		break;
		case "teenager":
		speaker_spr[page_number] = spr_teenager_portrait;
		txtb_spr[page_number] = spr_textbox_white;	
		snd[page_number] = snd_voice_teenager;
		break;
		case "teenager_angry":
		speaker_spr[page_number] = spr_teenager_portrait_angry;
		txtb_spr[page_number] = spr_textbox_red;
		snd[page_number] = snd_voice_teenager;
		break;
		case "teenager_sad":
		speaker_spr[page_number] = spr_teenager_portrait_sad;
		txtb_spr[page_number] = spr_textbox_blue;
		snd[page_number] = snd_voice_teenager;
		break;
		case "teenager_happy":
		speaker_spr[page_number] = spr_teenager_portrait_happy;
		txtb_spr[page_number] = spr_textbox_yellow;
		snd[page_number] = snd_voice_teenager;
		break;
		case "mother":
		speaker_spr[page_number] = spr_mother;
		txtb_spr[page_number] = spr_textbox_cyan;
		snd[page_number] = snd_voice_mother;
		break;
		case "mother_sad":
		speaker_spr[page_number] = spr_mother_sad;
		txtb_spr[page_number] = spr_textbox_dark_cyan;
		snd[page_number] = snd_voice_mother;
		break;
		case "angry":
		speaker_spr[page_number] = noone;
		txtb_spr[page_number] = spr_textbox_red;
		snd[page_number] = snd_voice_teenager;
		break;
		
		
	}
	}
	
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2] 
	}
	
	page_number++;
	
}





function scr_option(_option,_link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

function create_textbox(_text_id)
{
		with (instance_create_depth(0,0,-10000,obj_textbox))
	
	{
		scr_game_text(_text_id);
	}
}


