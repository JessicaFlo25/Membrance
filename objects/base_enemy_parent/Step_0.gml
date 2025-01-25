//take damage from damage source 
if place_meeting(x,y, enemy1_obj) {
    //check what type of damage it is receiving
    var type = instance_place(x,y, enemy1_obj);
    
    //take damage based on the instance type
    hp -= type.damage;
    
    //destroy the instance once it hits the enemy 
    type.destroy = true;
}

//die logic
if hp <= 0 {
    //add xp logic here before the instance deletes itself
    //LOGIC HERE
    instance_destroy()
}