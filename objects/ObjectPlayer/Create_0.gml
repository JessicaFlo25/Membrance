//damage setup
create_damage_list(10, true);
max_hp = hp;

//variables for movement
moveDir = 0;
move_speed = 6;

//for collisions
tile = layer_tilemap_get_id("tile");

//our aim direction that we will change in every step
aimDir = 0

//sprite control for our weapon/correct aiming
centerYOffset = - 5;
centerY = y + centerYOffset;


//bullet logic
bulletObj = ObjectBullet;
shotgunBullet = oShotgun;
canShoot = true;       // shooting availability
shootTimer = 0;
shootCooldown = 5;

//leveling logic

xp = 0;
level =1;
required = 50;


weaponType = 1;

function add_xp(xp_to_add) {
    xp += xp_to_add;
    
    if(xp >= required) {
        level++;
        xp -= required;
        required *=1.5;
        
        max_hp *= 1.15;
        hp = max_hp;
        
        move_speed *= 1.005;
        if weaponType == 1 {
            ObjectBullet.damage *=2;
        } else if weaponType == 2 {
            shotgunBullet.damage *=1.25;
        }
    }
}