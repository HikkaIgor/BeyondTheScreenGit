state = image_index;

if image_index == 0 && place_meeting(x,y,obj_pushblock) && obj_pushblock._scale = 2
{
	image_index = 1
	obj_SFX.buttonPressedSnd = true;
	state = 1;
}

if image_index == 1 && !place_meeting(x,y,obj_pushblock)
{
	image_index = 0
	obj_SFX.buttonReleasedSnd = true;
	state = 0;
}

