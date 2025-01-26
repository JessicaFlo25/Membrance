// Get a random enemy from the array
var enemy_type = enemy_array[irandom(array_length(enemy_array) - 1)];

// Get a random position in the room
var spawn_x = irandom_range(0, room_width);
var spawn_y = irandom_range(0, room_height);

// Create the enemy at the random position
instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);

// Reset the alarm to keep spawning enemies
alarm[0] = 60; // Spawn another enemy in 1 second