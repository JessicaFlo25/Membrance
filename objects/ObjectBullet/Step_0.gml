xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

//take care of collisions of bullets
move_and_collide(xspd, yspd, tile);

//delete the bullet based on collision and leaving the screen
if destroy == true {
    instance_destroy();
}

if place_meeting(x, y, tile) || place_meeting(x,y, ObjectEnemyParent) {
    destroy = true;
}

if point_distance(xstart, ystart, x, y) > maxDist {destroy = true;}


