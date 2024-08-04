right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
interact_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)

// Initialize interaction flag
var can_interact = false;

var _check_dir = face * 90;
var _check_x = x + lengthdir_x(interact_dist, _check_dir);
var _check_y = y + lengthdir_y(interact_dist, _check_dir);

var _interactable_objects = [
    instance_place(_check_x, _check_y, obj_bed),
    instance_place(_check_x, _check_y, obj_tumb),
    instance_place(_check_x, _check_y, obj_toy_box),
    instance_place(_check_x, _check_y, obj_computer),
    instance_place(_check_x, _check_y, obj_wardrobe),
    instance_place(_check_x, _check_y, obj_bookshelf),
    instance_place(_check_x, _check_y, obj_door),
    instance_place(_check_x, _check_y, obj_scale),
    instance_place(_check_x, _check_y, obj_backpack),
    instance_place(_check_x, _check_y, obj_plants),
    instance_place(_check_x, _check_y, obj_door_1)
];

// Check if any interactable objects exist
for (var i = 0; i < array_length(_interactable_objects); i++) {
    if instance_exists(_interactable_objects[i]) {
        can_interact = true;
        break;
    }
}

// Interact with the object if the interact key is pressed
if (interact_key_pressed && !paused) {
    for (var i = 0; i < array_length(_interactable_objects); i++) {
        var obj = _interactable_objects[i];
        if instance_exists(obj) {
            obj.face_dir = face;
            with (instance_create_depth(0, 0, -9999, obj_textbox)) {
                scr_game_text(obj.text_id);
            }
            can_interact = false; // Reset the interaction flag after interacting
            break;  // Interact with only one object at a time
        }
    }
}
player_can_interact = can_interact;
// Input
if paused = 0
{
input_vertical = down_key - up_key
input_horizontal = right_key - left_key

}
dt = delta_time / 1000000;

delta_x = 0;
delta_y = 0;

// Movement

if (input_vertical == 1 and input_horizontal == 0) {
	delta_x = 1;
	delta_y = 1;
	last_direction = 0;
	face = last_direction;
} else if (input_vertical == -1 and input_horizontal == 0) {
	delta_x = -1;
	delta_y = -1;
	last_direction = 4;
	face = last_direction;
} else if (input_vertical == 0 and input_horizontal == 1) {
	delta_x = (0.5 / cos(degtorad(30)));
	delta_y = -(0.5 / cos(degtorad(30)));
	last_direction = 6;
	face = last_direction;
} else if (input_vertical == 0 and input_horizontal == -1) {
	delta_x = -(0.5 / cos(degtorad(30)));
	delta_y = (0.5 / cos(degtorad(30)));
	last_direction = 2;
	face = last_direction;
} else if (input_vertical == 1 and input_horizontal == 1) {
	delta_x = 1;
	delta_y = 0;
	last_direction = 7;
	face = last_direction;
} else if (input_vertical == 1 and input_horizontal == -1) {
	delta_x = 0;
	delta_y = 1;
	last_direction = 1;
	face = last_direction;
} else if (input_vertical == -1 and input_horizontal == 1) {
	delta_x = 0;
	delta_y = -1;
	last_direction = 5;
	face = last_direction;
} else if (input_vertical == -1 and input_horizontal == -1) {
	delta_x = -1;
	delta_y = 0;
	last_direction = 3;
	face = last_direction;
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

depth = -bbox_bottom

if (instance_exists(obj_pauser)) {
	
	sprite_index = spr_child_idle;
	image_index = face;
	movement_speed = 0
    paused = 1;
	player_can_interact = false;
} else {
    paused = 0;
	movement_speed = 75
}