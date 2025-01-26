//move towards player logic (faster for this bubble)
// decrease the move timer
move_timer -= 1;

// check if the timer has expired
if (move_timer <= 0) {
    can_move = !can_move; // toggle movement bool
    move_timer = 120;     // reset the timer
}

// move towards player only if allowed to move
if (can_move) {
    dir = point_direction(x, y, ObjectPlayer.x, ObjectPlayer.y);

    xspd = lengthdir_x(spd, dir);
    yspd = lengthdir_y(spd, dir);

    
    move_and_collide(xspd, yspd, tile);
} else {
    // stay stationary
    xspd = 0;
    yspd = 0;
}

// Inherit the parent event
event_inherited();

