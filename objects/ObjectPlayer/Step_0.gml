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

// Step Event (or equivalent)
if (keyboard_check_pressed(ord("1"))) {
    weaponType = 1; // Single stream
} else if (keyboard_check_pressed(ord("2"))) {
    weaponType = 2; // Shotgun
}

move_and_collide(dx, dy, tile);
if (shootTimer > 0) {
    shootTimer--;
}

// Shooting Logic
if (canShoot && shootTimer <= 0) {
    // Reset timer
    shootTimer = shootCooldown;
    
    // Single stream shooting
    if (weaponType == 1) {
        var bYoffset = lengthdir_y(60, aimDir);
        var bXoffset = lengthdir_x(-45, aimDir);
        var bullet = instance_create_depth(x + bYoffset, y + bXoffset, depth - 100, bulletObj);
        
        with (bullet) {
            dir = other.aimDir + 90;
        }
    }

    // Shotgun shooting
    if (weaponType == 2) {
        var numBullets = 4; // Number of bullets in the shotgun
        var spreadAngle = 30; // Total spread angle

        for (var i = 0; i < numBullets; i++) {
            var angleOffset = -spreadAngle / 2 + (spreadAngle / (numBullets - 1)) * i;

            var bYoffset = lengthdir_y(60, aimDir);
            var bXoffset = lengthdir_x(-45, aimDir);
            var bullet = instance_create_depth(x + bYoffset, y + bXoffset, depth - 100, shotgunBullet);
            
            with (bullet) {
                dir = other.aimDir + angleOffset + 90;
            }
        }
    }
}

// Adjust cooldown based on weapon type
if (weaponType == 1) {
    shootCooldown = 5; // Faster shooting for single stream
} else if (weaponType == 2) {
    shootCooldown = 20; // Slower shooting for shotgun
}

depth = -bbox_bottom;

//damage for the player 
get_damage(oDamagePlayer, true);

move_wrap(true, true, 0);

if hp <= 0 {
    game_restart();
}