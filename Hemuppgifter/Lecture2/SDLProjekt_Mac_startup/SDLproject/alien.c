#include "player.h"
#include <math.h>

GameObject alien;

extern const Uint8 *state;

void createShip(){
    // Create an object
    alien.gfxObj = createGfxObject(  "../ship.png" );
    alien.gfxObj.outputWidth  = 200;
    alien.gfxObj.outputHeight = 200;
    alien.speed = 3;
    alien.scale = 1;
    alien.pos.x = 400;
    alien.pos.y = 300;
    alien.angle = 0;
    alien.angleSpeed = 0.2;
    
    alien.update = updateAlien;
    alien.render = render;
    
    gameObjects[nGameObjects++] = &alien;
}


void updateShip(GameObject* this){
    //TODO: MAKE ALIEN DO STUFF
}


        
