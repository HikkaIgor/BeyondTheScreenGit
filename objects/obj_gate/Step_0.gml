if instance_exists(button_obj)
{
	state = button_obj.state;
}


if state == 0 
{
	mask_index = sprite_index;
}

if state == 1
{
	mask_index = spr_no_collisions;
}
image_index = state;