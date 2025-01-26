//draw our player sprite
draw_self();
//get the weapon off the player's body
//var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
//var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);


//flip orientation of the weapon based on where the player is looking
//var wpnScale = 1;

//if aimDir > 90 && aimDir < 270 {
  //  wpnScale = -1;
//}

//draw the weapon on our player's body
//draw_sprite_ext(SWeapon1, 0, x, centerY + _yOffset, 1, wpnScale, aimDir + 90, c_white, 1);

//draw hp
// Calculate the percentage of health
var health_percentage = (hp / max_hp) * 100;

// Position and size of the health bar
var bar_x1 = x - sprite_width / 2 - 120;  // Align to the left of the sprite
var bar_y1 = y + sprite_height / 2 + 50;  // Just below the sprite
var bar_x2 = bar_x1 + 100;  // Make the bar 100 pixels wide
var bar_y2 = bar_y1 + 10;  // The height of the bar is 10 pixels

// Draw the health bar
draw_healthbar(bar_x1, bar_y1, bar_x2, bar_y2, health_percentage, c_black, c_white, c_white, 0, true, true);

// Draw the numerical health value below the bar
var health_text_x = (bar_x1 + bar_x2) / 2;  // Center the text below the bar
var health_text_y = bar_y2 + 5;  // Position the text slightly below the bar
draw_text(health_text_x, health_text_y, string(hp));

//xp bar for player 

var bar_width = 200;
var bar_height = 20;
var bar_offset_x = 10;
var bar_offset_y = 10;

//adaptive bar
draw_set_color(c_black);
draw_rectangle(bar_offset_x, bar_offset_y, bar_offset_x + bar_width, bar_offset_y + bar_height, false);

// Calculate XP progress
var xp_progress = xp / required;

// Draw the filled portion of the XP bar
draw_set_color(c_blue);
draw_rectangle(bar_offset_x + 1, bar_offset_y + 1, bar_offset_x + (bar_width * xp_progress) - 1, bar_offset_y + bar_height - 1, false);

// Draw the level text
draw_set_color(c_white);
draw_text(bar_offset_x + bar_width + 10, bar_offset_y, "Level: " + string(level));
draw_text(bar_offset_x, bar_offset_y + bar_height + 5, "XP: " + string(xp) + " / " + string(required));
