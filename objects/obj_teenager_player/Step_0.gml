right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
interact_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter);
var _s = id


if interact_key_pressed == true && paused = 0
{
	var _check_dir = face * 90;
	
	var _check_x = x + lengthdir_x(interact_dist, _check_dir);
	var _check_y = y + lengthdir_y(interact_dist, _check_dir);
	var _tumb = instance_place(_check_x,_check_y,obj_tumb_teenager);
	var _bed = instance_place(_check_x,_check_y,obj_bed_teenager);
	var _sport = instance_place(_check_x,_check_y,obj_sport_teenager);
	var _computer = instance_place(_check_x,_check_y,obj_computer_teenager);
	var _trash = instance_place(_check_x,_check_y,obj_trash_teenager);
	var _plant = instance_place(_check_x,_check_y,obj_plant_teenager);
	var _table = instance_place(_check_x,_check_y,obj_table_teenager);
	var _wardrobe = instance_place(_check_x,_check_y,obj_wardrobe_teenager);
	var _bookshelf = instance_place(_check_x,_check_y,obj_bookshelf_teenager);
	var _door = instance_place(_check_x,_check_y,obj_door_teenager);
	var _guitar = instance_place(_check_x,_check_y,obj_guitar_teenager);
	
	//Тумбочка
	if instance_exists(_tumb)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_tumb_teenager.text_id);
		}
	
	}
	//Кровать
	if instance_exists(_bed)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_bed_teenager.text_id);
		}
	}
	//Спорт
	if instance_exists(_sport)
	{
			if global._no_sport = 0
			{
				if global._sport= 0
				{
						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_sport_teenager.text_id);
					}
				}
				if global._sport = 1
				{

						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_sport_teenager_1.text_id);
					}
				}
			}
			else
			{
				with(instance_create_depth(0,0,-9999,obj_textbox))
				{
					scr_game_text(obj_sport_teenager_2.text_id);	
				}
			}
	}
	//Стол
	if instance_exists(_table)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_table_teenager.text_id);
		}
	}

	//Гитара
	if instance_exists(_guitar)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_guitar_teenager.text_id);
		}
	}
	//Мусорка
	if instance_exists(_trash)
	{
			if global._trash_not_clean = 0
			{
				if global._trash_clean = 0
				{
						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_trash_teenager.text_id);
					}
				}
				if global._trash_clean = 1
				{

						with(instance_create_depth(0,0,-9999,obj_textbox))
					{
						scr_game_text(obj_trash_teenager_1.text_id);
					}
				}
			}
			else
			{
				with(instance_create_depth(0,0,-9999,obj_textbox))
				{
					scr_game_text(obj_trash_teenager_2.text_id);	
				}
			}
	}
	//Шкаф
	if instance_exists(_wardrobe)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_wardrobe_teenager.text_id);
		}
	}
	//Книжный шкаф
	if instance_exists(_bookshelf)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_bookshelf_teenager.text_id);
		}
	}
	//Цветок
	if instance_exists(_plant)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_plant_teenager.text_id);
		}
	}
	//Дверь
	if instance_exists(_door)
	{	
		
				with(instance_create_depth(0,0,-9999,obj_textbox))
			{
				scr_game_text(obj_door_teenager.text_id);
			}
		
	}
	//Компьютер
	if instance_exists(_computer)
	{
			with(instance_create_depth(0,0,-9999,obj_textbox))
		{
			scr_game_text(obj_computer_teenager.text_id);
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