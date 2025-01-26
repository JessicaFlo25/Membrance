function create_damage_list(_hp = 10, iframes = false){
    hp = _hp;
    
    //get iframes 
    if iframes == true {
        iframeTimer = 0;
        iframeDur = 90;
    }
    //create damageList
    if iframes == false {
        damageList = ds_list_create();
    }
}

function cleanup_dmg_list() {
    ds_list_destroy(damageList);
}


function get_damage(damageObj, iframes = false) {
    
    //iframes check for the player 
    if iframes == true && iframeTimer > 0 {
        iframeTimer--;
        
        if iframeTimer mod 5 == 0 {
            if image_alpha = 1 {
                image_alpha = 0;
            } else {image_alpha =1;}
        }
        
        exit;
    }
    
    //receive damage
    if place_meeting(x, y, damageObj) {
    
        //getting a list of the damage instances
        //create ds list and copy instances to it
        var _instList = ds_list_create();
        instance_place_list(x, y, damageObj, _instList, false);
    
        //get the size of our list
        var _listSize = ds_list_size(_instList);
    
        //loop through the list
        var hitConfirm = false;
        for (var i = 0; i < _listSize; i++) {
            //get a damage object instance from the list
            var _inst = ds_list_find_value(_instList, i);
    
            //check if this instance is already in the damage list
            if iframes == true || (ds_list_find_index(damageList, _inst) == -1) {
                //add the new damage instance to the damage list
                //optional iframes check for player
                if iframes == false {
                    ds_list_add(damageList, _inst);
                }
    
                //take damage from specific instance
                hp -= _inst.damage;
                hitConfirm = true;
                //tell the damage instance it has impacted
                _inst.hitConfirm = true;
            }
        }
        
        //set iframes if hit
        if iframes == true && hitConfirm == true {
            iframeTimer = iframeDur;
        }
    
        //free memory by destroying the ds list
        ds_list_destroy(_instList);
    }
    
    //clear the damage list of objects that don't exist anymore or aren't touching anymore
    if iframes == false {
      var _damageListSize = ds_list_size(damageList);
      for (var i = 0; i < _damageListSize; i++) {
          var _inst = ds_list_find_value(damageList, i);
          if !instance_exists(_inst) || !place_meeting(x, y, _inst) {
              ds_list_delete(damageList, i);
              i--;
              _damageListSize--;
          }
      } 
    }
}