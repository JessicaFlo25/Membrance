// basic movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));
centerY = y + centerYOffset;
aimDir = point_direction(x, centerY, mouse_x, mouse_y) - 90;
var move_dir = _hor * _hor + _ver * _ver;
var dx = 0;
var dy = 0

if (move_dir != 0) {
     dx = _hor * move_speed / move_dir;
     dy = _ver * move_speed / move_dir;
}

//change angle of sprite 
//image_angle = aimDir;

move_and_collide(dx, dy, tile);
if shootTimer > 0 {shootTimer--;};
//shooting logic
if canShoot && shootTimer <= 0 {
    //reset timer 
    shootTimer = shootCooldown;
    
    //create a bullet instance
    var bYoffest = lengthdir_y(60,aimDir);
    var bXoffset = lengthdir_x(-45, aimDir);
    var bullet = instance_create_depth(x + bYoffest, y + bXoffset, depth - 100, bulletObj);
    
    with(bullet) {
        dir = other.aimDir + 90;
    }
}
depth = -bbox_bottom;

//damage for the player 
get_damage(oDamagePlayer, true);

move_wrap(true, true, 0);

if hp <= 0 {
    game_restart();
}