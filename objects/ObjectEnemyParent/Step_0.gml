//take damage 
get_damage(ObjectEnemyDamage);

//die once hp is depleted 
if hp <= 0 {instance_destroy(); 
    
ObjectPlayer.add_xp(xp_to_give);
}
    
