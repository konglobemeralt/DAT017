#include "player.h"
#include <math.h>

GameObject ship;

extern const Uint8 *state;

void createShip(){
    // Create an object
    ship.gfxObj = createGfxObject(  "../ship.png" );
    ship.gfxObj.outputWidth  = 200;
    ship.gfxObj.outputHeight = 200;
    ship.speed = 3;
    ship.scale = 1;
    ship.pos.x = 400;
    ship.pos.y = 300;
    ship.angle = 0;
    ship.angleSpeed = 0.2;
    
    ship.update = updateShip;
    ship.render = render;
    
    gameObjects[nGameObjects++] = &ship;
}

void shake(vec2f* pos);

void updateShip(GameObject* this){
    
            if (state[SDL_SCANCODE_D]) {
                    this->pos.x = (this->pos.x+this->speed >= 799) ? 799 :  this->pos.x+this->speed;
                }
                
            if (state[SDL_SCANCODE_A]) {
                    this->pos.x = (this->pos.x-this->speed <= 0) ? 0 :  this->pos.x-this->speed;
            }
                
                if (state[SDL_SCANCODE_S]) {
                    this->pos.y = (this->pos.y+this->speed >= 599) ? 599 :  this->pos.y+this->speed;
            }
                
                if (state[SDL_SCANCODE_W]) {
                    this->pos.y = (this->pos.y-this->speed <= 0) ? 0 :  this->pos.y-this->speed;
            }
            
               if (state[SDL_SCANCODE_E]) {
                    this->angle = fmod(this->angle + this->angleSpeed, 360);
            }
            
               if (state[SDL_SCANCODE_Q]) {
                    this->angle = fmod(this->angle - this->angleSpeed, -360);
            }
}


        
        
int t = 0;
bool bShake = false;
int shakeStop = 0;

void shake(vec2f* pos)
{
    
    if( bShake == false && ((rand() % 60)==1) ) {
        bShake = true;
        shakeStop = t + (rand() % 20) + 30;
    }
    if( bShake && t < shakeStop) {
        pos->x += 2 *((t % 3) - 1);
        pos->y += ((rand() % 3) - 1); 
    }
    if( bShake && (t >= shakeStop) ) {
        bShake = false;
    }
    t++;
}
