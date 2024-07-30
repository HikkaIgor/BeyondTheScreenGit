if place_meeting(x,y,obj_player)
{
	state = 1;
	obj_pushblock.image_xscale = 1;
	obj_pushblock.image_yscale = 1;
}
else
{
	state = 0;
}

if state == 1
{
	with(obj_pushblock)
	{
		x = xstart;
		y = ystart;
	}
}

image_index = state;

