//move towards player logic 
dir = point_direction(x,y, ObjectPlayer.x, ObjectPlayer.y);

xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

//move_and_collide(xspd, yspd, oSBubble);
move_and_collide(xspd, yspd, tile);
// Inherit the parent tiler
event_inherited();


