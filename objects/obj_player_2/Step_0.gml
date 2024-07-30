// Input

input_vertical = keyboard_check(vk_down) - keyboard_check(vk_up);
input_horizontal = keyboard_check(vk_right) - keyboard_check(vk_left);

dt = delta_time / 1000000;


// Movement and animations

if (input_vertical == 1 and input_horizontal == 0) {
	x_3D += movement_speed * dt;
	y_3D += movement_speed * dt;
	last_direction = 0;
	sprite_index = spr_child_down;
} else if (input_vertical == -1 and input_horizontal == 0) {
	x_3D -= movement_speed * dt;
	y_3D -= movement_speed * dt;
	last_direction = 4;
	sprite_index = spr_child_up;
} else if (input_vertical == 0 and input_horizontal == 1) {
	x_3D += (0.5 / cos(degtorad(30))) * movement_speed * dt;
	y_3D -= (0.5 / cos(degtorad(30))) * movement_speed * dt;
	last_direction = 6;
	sprite_index = spr_child_right;
} else if (input_vertical == 0 and input_horizontal == -1) {
	x_3D -= (0.5 / cos(degtorad(30))) * movement_speed * dt;
	y_3D += (0.5 / cos(degtorad(30))) * movement_speed * dt;
	last_direction = 2;
	sprite_index = spr_child_left;
} else if (input_vertical == 1 and input_horizontal == 1) {
	x_3D += movement_speed * dt;
	last_direction = 7;
	sprite_index = spr_child_downright;
} else if (input_vertical == 1 and input_horizontal == -1) {
	y_3D += movement_speed * dt;
	last_direction = 1;
	sprite_index = spr_child_downleft;
} else if (input_vertical == -1 and input_horizontal == 1) {
	y_3D -= movement_speed * dt;
	last_direction = 5;
	sprite_index = spr_child_upright;
} else if (input_vertical == -1 and input_horizontal == -1) {
	x_3D -= movement_speed * dt;
	last_direction = 3;
	sprite_index = spr_child_upleft;
} else {
	sprite_index = spr_child_idle;
	image_index = last_direction;
}

// Calculat final position on screen

x = x_3D - y_3D;
y = (x_3D + y_3D) / 2;