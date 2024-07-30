right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
interact_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)
var _s = id


if interact_key_pressed == true && paused = 0
{
	var _check_dir = face * 90;
	
	var _check_x = x + lengthdir_x(interact_dist, _check_dir);
	var _check_y = y + lengthdir_y(interact_dist, _check_dir);
	var _bed = instance_place(_check_x,_check_y,obj_bed);
	var _tumb = instance_place(_check_x,_check_y,obj_tumb);
	var _toy_box =  instance_place(_check_x,_check_y,obj_toy_box);
	var _computer = instance_place(_check_x,_check_y,obj_computer);
	var _wardrobe = instance_place(_check_x,_check_y,obj_wardrobe);
	var _bookshelf = instance_place(_check_x,_check_y,obj_bookshelf);
	var _door = instance_place(_check_x,_check_y,obj_door);
	var _scale = instance_place(_check_x,_check_y,obj_scale);
	var _backpack = instance_place(_check_x,_check_y,obj_backpack);
	var _plants = instance_place(_check_x,_check_y,obj_plants);
	var _door_1 = instance_place(_check_x,_check_y,obj_door_1);

	
	//Кровать
	if instance_exists(_bed)
	{
		_bed.face_dir = face;
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_bed.text_id);
		}
		
	}
	//Тумбочка
	if instance_exists(_tumb)
	{
		_tumb.face_dir = face;
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_tumb.text_id);
		}
	}
	//Коробка с игрушками
	if instance_exists(_toy_box)
	{
		if global._played = 0
		{
				with(instance_create_depth(0,0,-9999,obj_textbox))
			{
				scr_game_text(obj_toy_box.text_id);
			}
		}
		else
		{
				with(instance_create_depth(0,0,-9999,obj_textbox))
			{
				scr_game_text(obj_toy_box_1.text_id);
			}
		}
	}
	//Компьютерный стол
	if instance_exists(_computer)
	{
			_computer.face_dir = face;
				with(instance_create_depth(0,0,-9999,obj_textbox))
			{
				scr_game_text(obj_computer.text_id);
			}
	}
	//Книжный шкаф
	if instance_exists(_bookshelf)
	{
		
			_bookshelf.face_dir = face;
				with(instance_create_depth(0,0,-9999,obj_textbox))
			{
				scr_game_text(obj_bookshelf.text_id);
			}
	}
	
	//шкаф
	if instance_exists(_wardrobe)
	{
		_wardrobe.face_dir = face;
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_wardrobe.text_id);
		}
	}
	//дверь
	if instance_exists(_door)
	{
			if global._not_helped_mom = 0
			{
				if global._helped_mom = 0
				{
					_door.face_dir = face;
						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_door.text_id);
					}
				}
				if global._helped_mom = 1
				{

						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_door_1.text_id);
					}
				}
			}
			else
			{
				with(instance_create_depth(0,0,-9999,obj_textbox))
				{
					scr_game_text(obj_door_2.text_id);	
				}
			}
	}
	//рост
	if instance_exists(_scale)
	{
		_scale.face_dir = face;
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_scale.text_id);
		}
	}
	//Рюкзак
	if instance_exists(_backpack)
	{
		_backpack.face_dir = face;
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_backpack.text_id);
		}
	}
	//Растения
	
	if instance_exists(_plants)
	{
			if global._nepolit = 0
			{
				if global._polit = 0
				{
					_plants.face_dir = face;
						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_plants.text_id);
					}
				}
				if global._polit = 1
				{

						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_plants_1.text_id);
					}
				}
			}
			else
			{
				with(instance_create_depth(0,0,-9999,obj_textbox))
				{
					scr_game_text(obj_plants_2.text_id);	
				}
			}
	}
}



	x_speed = (right_key - left_key) * move_speed;
	y_speed = (down_key - up_key) * move_speed;


//Пауза
if instance_exists(obj_pauser)
	{
		x_speed = 0;
		y_speed = 0;
		paused = 1;
	}
else {paused = 0}
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


x += x_speed-y_speed;
y += (y_speed+x_speed)/2;





//Анимация
if x_speed == 0 && y_speed == 0 
	{
		image_index = 0;
	}


//Глубина

depth = -bbox_bottom;