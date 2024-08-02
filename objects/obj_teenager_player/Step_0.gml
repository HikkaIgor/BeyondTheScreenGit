right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
interact_key_pressed = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter);
var _s = id

// Step Event Code

// Initialize interaction flag
var can_interact = false;

var _check_dir = face * 90;
var _check_x = x + lengthdir_x(interact_dist, _check_dir);
var _check_y = y + lengthdir_y(interact_dist, _check_dir);

var _interactable_objects = [
    instance_place(_check_x, _check_y, obj_tumb_teenager),
    instance_place(_check_x, _check_y, obj_bed_teenager),
    instance_place(_check_x, _check_y, obj_sport_teenager),
    instance_place(_check_x, _check_y, obj_computer_teenager),
    instance_place(_check_x, _check_y, obj_trash_teenager),
    instance_place(_check_x, _check_y, obj_plant_teenager),
    instance_place(_check_x, _check_y, obj_table_teenager),
    instance_place(_check_x, _check_y, obj_wardrobe_teenager),
    instance_place(_check_x, _check_y, obj_bookshelf_teenager),
    instance_place(_check_x, _check_y, obj_door_teenager),
    instance_place(_check_x, _check_y, obj_guitar_teenager)
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
            with (instance_create_depth(0, 0, -9999, obj_textbox)) {
                scr_game_text(obj.text_id);
            }
            break;  // Interact with only one object at a time
        }
    }
}

// Store the can_interact state to be used in the Draw event
if (can_interact) {
    // Store this value in a variable that can be accessed in the Draw event
    player_can_interact = true;
} else {
    player_can_interact = false;
}

// Movement and other logic...

x_speed = (right_key - left_key) * move_speed;
y_speed = (down_key - up_key) * move_speed;

if (instance_exists(obj_pauser)) {
    x_speed = 0;
    y_speed = 0;
    paused = 1;
	player_can_interact = false;
} else {
    paused = 0;
}

mask_index = sprite[IDLE];
if (y_speed == 0) {
    if (x_speed > 0) { face = RIGHT; }
    if (x_speed < 0) { face = LEFT; }
}
if (x_speed > 0 && face == LEFT) { face = RIGHT; }
if (x_speed < 0 && face == RIGHT) { face = LEFT; }
if (x_speed == 0) {
    if (y_speed > 0) { face = DOWN; }
    if (y_speed < 0) { face = UP; }
}
if (y_speed > 0 && face == UP) { face = DOWN; }
if (y_speed < 0 && face == DOWN) { face = UP; }

sprite_index = sprite[face];

if (place_meeting(x + x_speed, y, obj_wall)) { x_speed = 0; }
if (place_meeting(x, y + y_speed, obj_wall)) { y_speed = 0; }

x += x_speed - y_speed;
y += (y_speed + x_speed) / 2;

if (x_speed == 0 && y_speed == 0) {
    image_index = 0;
}

depth = -bbox_bottom;
