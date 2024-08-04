// Draw Event Code

// First, draw the player normally
draw_self();

// Then, draw the interaction indicator if the player can interact with an object
if (player_can_interact) {
    var e_sprite_x = x;
    var e_sprite_y = y - sprite_height; // Adjust the y-offset as needed
    draw_sprite_ext(spr_interact, 0, e_sprite_x, e_sprite_y,2,2,0,c_white,1);
}
