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
canShoot = true;       // shooting availability
shootTimer = 0;
shootCooldown = 5;
