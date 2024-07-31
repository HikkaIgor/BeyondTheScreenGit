// Input

input_vertical = keyboard_check(vk_down) - keyboard_check(vk_up);
input_horizontal = keyboard_check(vk_right) - keyboard_check(vk_left);

dt = delta_time / 1000000;

delta_x = 0;
delta_y = 0;

// Movement

if (input_vertical == 1 and input_horizontal == 0) {
	delta_x = 1;
	delta_y = 1;
	last_direction = 0;
} else if (input_vertical == -1 and input_horizontal == 0) {
	delta_x = -1;
	delta_y = -1;
	last_direction = 4;
} else if (input_vertical == 0 and input_horizontal == 1) {
	delta_x = (0.5 / cos(degtorad(30)));
	delta_y = -(0.5 / cos(degtorad(30)));
	last_direction = 6;
} else if (input_vertical == 0 and input_horizontal == -1) {
	delta_x = -(0.5 / cos(degtorad(30)));
	delta_y = (0.5 / cos(degtorad(30)));
	last_direction = 2;
} else if (input_vertical == 1 and input_horizontal == 1) {
	delta_x = 1;
	delta_y = 0;
	last_direction = 7;
} else if (input_vertical == 1 and input_horizontal == -1) {
	delta_x = 0;
	delta_y = 1;
	last_direction = 1;
} else if (input_vertical == -1 and input_horizontal == 1) {
	delta_x = 0;
	delta_y = -1;
	last_direction = 5;
} else if (input_vertical == -1 and input_horizontal == -1) {
	delta_x = -1;
	delta_y = 0;
	last_direction = 3;
}


// Colisions

fut_x_3D = x_3D + delta_x * movement_speed * dt;
fut_y_3D = y_3D + delta_y * movement_speed * dt;

x1_3D = fut_x_3D - collision_size / 2;
y1_3D = fut_y_3D - collision_size / 2;

x2_3D = fut_x_3D + collision_size / 2;
y2_3D = fut_y_3D + collision_size / 2;


for (var i = 0; i < instance_number(obj_solid); ++i;)
{
    var _solid = instance_find(obj_solid, i);
	
	if ((x1_3D >= _solid.x1_3D and x1_3D <= _solid.x2_3D) or (x2_3D >= _solid.x1_3D and x2_3D <= _solid.x2_3D)) and (y1_3D <= _solid.y1_3D and _solid.y1_3D <= y2_3D) {
		delta_x = 0;
		delta_y = 0;
	}

	if ((y1_3D <= _solid.y1_3D and y1_3D >= _solid.y2_3D) or (y2_3D <= _solid.y1_3D and y2_3D >= _solid.y2_3D)) and (x1_3D <= _solid.x1_3D and _solid.x1_3D <= x2_3D) {
		delta_x = 0;
		delta_y = 0;
	}
}


// Animations

if (delta_x == 1 and delta_y == 1) {
	sprite_index = spr_child_down;
} else if (delta_x == -1 and delta_y == -1) {
	sprite_index = spr_child_up;
} else if (delta_x == (0.5 / cos(degtorad(30))) and delta_y == -(0.5 / cos(degtorad(30)))) {
	sprite_index = spr_child_right;
} else if (delta_x == -(0.5 / cos(degtorad(30))) and delta_y == (0.5 / cos(degtorad(30)))) {
	sprite_index = spr_child_left;
} else if (delta_x == 1 and delta_y == 0) {
	sprite_index = spr_child_downright;
} else if (delta_x == 0 and delta_y == 1) {
	sprite_index = spr_child_downleft;
} else if (delta_x == 0 and delta_y == -1) {
	sprite_index = spr_child_upright;
} else if (delta_x == -1 and delta_y == 0) {
	sprite_index = spr_child_upleft;
} else {
	sprite_index = spr_child_idle;
	image_index = last_direction;
}


// Calculate final position on screen

x_3D += delta_x * movement_speed * dt;
y_3D += delta_y * movement_speed * dt;

x = x_3D - y_3D;
y = (x_3D + y_3D) / 2;