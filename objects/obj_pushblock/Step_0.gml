if position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{
	if image_xscale = 1 && (cooldown < 1)
{
	_scale = 2
	image_xscale = 2;
	image_yscale = 2;
	move_speed = 1
	cooldown = 5

	if place_meeting(target_x,target_y,obj_wall) || place_meeting(target_x,target_y,obj_player) || place_meeting(target_x,target_y,obj_pushblock_area) 
	{
		
		image_xscale = 1;
		image_yscale = 1;
		move_speed = 2
		image_index = 1;
	}
		
}
else image_index = 0;
cooldown = cooldown - 1;
}




if sliding == false
{
	start_point_x = x;
	start_point_y = y;
	
	x_speed = 0;
	y_speed = 0;
}

if place_meeting(x,y,obj_pushblock_area)
{
	pushblock_area = true;
}
else
{
	pushblock_area = false;
}


if sliding == true 
{
	var _real_dir = face_dir * 90;
	
	var _target_x_dist = lengthdir_x(grid_space, _real_dir);
	var _target_y_dist = lengthdir_y(grid_space, _real_dir);
	target_x = start_point_x + _target_x_dist;
	target_y = start_point_y + _target_y_dist;
	
	var _target_dist = point_distance(x,y,target_x,target_y);
	var _final_speed = min(move_speed, _target_dist);
	x_speed = lengthdir_x(_final_speed, _real_dir);
	y_speed = lengthdir_y(_final_speed, _real_dir);
	if pushblock_area == true && !place_meeting(target_x,target_y,obj_pushblock_area) && image_xscale >= 1
	{
		x_speed = 0;
		y_speed = 0;

	}
	
	if place_meeting(target_x,target_y,obj_wall)
	{
		x_speed = 0;
		y_speed = 0;
		image_index = 1;
	}
	else image_index = 0;
	if pushblock_area == false && place_meeting(target_x,target_y,obj_pushblock_area) && image_xscale > 1
	{
		x_speed = 0;
		y_speed = 0;
		image_index = 1;
	}
	else image_index = 0;
}


x += x_speed;
y += y_speed;

if x_speed == 0 && y_speed == 0
{
	sliding = false;
}
if place_meeting(x,y,obj_pressing_button)
{
image_index = 1;
}

if place_meeting(x,y,obj_pressing_button_2x2) && image_xscale = 2
{
image_index = 1;
}


depth = -bbox_bottom;


