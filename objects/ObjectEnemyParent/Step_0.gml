//take damage 
if place_meeting(x,y, ObjectEnemyDamage) {
    var inst = instance_place(x,y, ObjectEnemyDamage);
    
    //take damage from specific bullet instance
    hp -= inst.damage;
}

//die once hp is depleted 
if hp <= 0 {instance_destroy();}