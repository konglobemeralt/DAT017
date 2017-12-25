#include "background.h"

extern const Uint8 *state;

GameObject background;

void createBackground(){
    background.gfxObj = createGfxObject( "../background.jpg" );
    background.gfxObj.outputWidth = WINDOW_WIDTH;
    background.gfxObj.outputHeight = WINDOW_HEIGHT;
    background.pos.x = 400;
    background.pos.y = 300;
    background.scale = 1.8f;
    
    //Background angle osv
    background.angle = 0;
    background.scale = 1;
    
    background.update = updateBackground;
    background.render = render;
    
    gameObjects[nGameObjects++] = &background;
    }

void updateBackground(GameObject* this){
     //update rotation
        this->angle = fmod(this->angle +0.03, 360);
        this->scale += 0.001;
    }