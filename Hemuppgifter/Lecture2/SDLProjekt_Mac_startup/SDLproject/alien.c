#include "alien.h"

GameObject aliens[3];

extern const Uint8 *state;

void updateAlien(GameObject* this){
    //TODO: MAKE ALIEN DO STUFF
}

void createAlienShip(int i){
    
    static GfxObject gfx;
    static bool first = true;
    
    
    if(first){
        first = false;
        gfx = createGfxObject(  "../alienship.png" );
        gfx.outputWidth = 100;
        gfx.outputHeight = 100;
        
        }
    // Create an object
    aliens[i].gfxObj = gfx;
    aliens[i].speed = 2;
    aliens[i].scale = 1;
    aliens[i].pos.x = (200 * i) + 200;
    aliens[i].pos.y = 200;
    aliens[i].angle = 0;
    aliens[i].angleSpeed = 0.2;
    
    aliens[i].update = updateAlien;
    aliens[i].render = render;
    
    gameObjects[nGameObjects++] = &aliens[i];
}

void createAliens(){
    
    for(int i=0; i<3; i++){
        createAlienShip(i);
    }
}




        
