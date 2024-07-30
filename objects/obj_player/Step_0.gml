right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
interact_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)



if interact_key_pressed == true
{
	var _check_dir = face * 90;
	
	var _check_x = x + lengthdir_x(interact_dist, _check_dir);
	var _check_y = y + lengthdir_y(interact_dist, _check_dir);
	var _push_block_inst = instance_place(_check_x,_check_y,obj_pushblock)

	if instance_exists(_push_block_inst) && _push_block_inst.sliding == false
	{
		_push_block_inst.sliding = true;
		_push_block_inst.face_dir = face;
		
	}

}



	x_speed = (right_key - left_key) * move_speed;
	y_speed = (down_key - up_key) * move_speed;


//Пауза
if instance_exists(obj_pauser)
	{
		x_speed = 0;
		y_speed = 0;
	}

//Сторона, в которую смотрит игрок
mask_index = sprite[IDLE]
if y_speed == 0 
	{
	if x_speed > 0 {face = RIGHT};
	if x_speed < 0 {face = LEFT};
	};
if x_speed > 0 && face = LEFT {face = RIGHT};
if x_speed < 0 && face = RIGHT {face = LEFT};

if x_speed == 0 
	{
	if y_speed > 0 {face = DOWN};
	if y_speed < 0 {face = UP};
	};

if y_speed > 0 && face = UP {face = DOWN};
if y_speed < 0 && face = DOWN {face = UP};

sprite_index = sprite[face];


//Коллизия
if place_meeting(x+x_speed,y,obj_wall) == true
	{
	x_speed = 0;
	}

if place_meeting(x,y+y_speed,obj_wall) == true
	{
	y_speed = 0;
	}
if place_meeting(x+x_speed,y,obj_pushblock_area) == true
	{
	x_speed = 0;
	}

if place_meeting(x,y+y_speed,obj_pushblock_area) == true
	{
	y_speed = 0;
	}


x += x_speed
y += y_speed





//Анимация
if x_speed == 0 && y_speed == 0 
	{
		image_index = 0;
	}


//Глубина

depth = -bbox_bottom;



