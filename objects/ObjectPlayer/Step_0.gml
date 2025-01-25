// basic movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var move_dir = _hor * _hor + _ver * _ver;
var dx = 0;
var dy = 0

if (move_dir != 0) {
     dx = _hor * move_speed / move_dir;
     dy = _ver * move_speed / move_dir;
}


move_and_collide(dx, dy, tile);