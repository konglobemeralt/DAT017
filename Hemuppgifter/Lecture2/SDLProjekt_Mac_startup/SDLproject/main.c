#include "renderer.h"
#include "vecmath.h"
#include "gameobject.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define WINDOW_WIDTH 800 
#define WINDOW_HEIGHT 600

typedef volatile int* port32ptr;
#define INUTPORT_X_ADDR &x;
#define INUTPORT_X *((port32ptr)INUTPORT_X_ADDR)

#define INUTPORT_Y_ADDR &y;
#define INUTPORT_Y *((port32ptr)INUTPORT_Y_ADDR)

GameObject ship, background;
GameObject* gameObjects[] = {&background, &ship};
int nGameObjects = 2;

const Uint8 *state;

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
        
void updateBackground(GameObject* this){
     //update rotation
        this->angle = fmod(this->angle +0.03, 360);
        this->scale += 0.001;
    }
    
void render(GameObject* this){
    renderGfxObject(&this->gfxObj, this->pos.x, this->pos.y, this->angle, this->scale);
        }

int t = 0;
bool bShake = false;
int shakeStop = 0;

void close();

void printToWindow(char* str, int x, int y){
    renderText(str, x, y);
    }

void printToConsole(char* str, int x, int y){
    printf("%s\n", str);
    }

void (*print) (char* str, int x, int y) = printToWindow;
bool toggle = true;

void vandString(char str[]){
    
    int l = strlen(str);
    int half_len = l/2;
    for(int i=0; i<half_len; i++){
        char t = str[i];
        str[i] = str[l - i - 1];
        str[l - i - 1] = t;
        }
    }

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


int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
	// Start up SDL and create window of width=800, height = 600
	initRenderer(WINDOW_WIDTH, WINDOW_HEIGHT); 
    
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
    
    background.gfxObj = createGfxObject( "../background.jpg" );
    background.gfxObj.outputWidth = WINDOW_WIDTH;
    background.gfxObj.outputHeight = WINDOW_HEIGHT;
    background.pos.x = 400;
    background.pos.y = 300;
    background.scale = 1.8f;
    
    //Background angle osv
    background.angle = 0;
    background.scale = 1;
    
    char string[] = "Hello World!";
    int loopIter = 0;
    
    // get pointer to key states
    state = SDL_GetKeyboardState(NULL); 
    
    ship.update = updateShip;
    ship.render = render;
    
    background.update = updateBackground;
    background.render = render;
    
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
            
            if(( e.type == SDL_KEYDOWN) && (e.key.keysym.scancode == SDL_SCANCODE_F)){
                toggle = !toggle;
                if(!toggle){
                    print = printToConsole;
                    }
                else{
                    print = printToWindow;
                    }
                
                }
            
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );
        
        for(int i = 0; i < nGameObjects; i++){
                gameObjects[i]->update(gameObjects[i]);
            }
        for(int i = 0; i < nGameObjects; i++){
                gameObjects[i]->render(gameObjects[i]);
            }

        shake(&gameObjects[1]->pos);
        
        print(string, 300, 150);
        
        if((loopIter % 100) == 99){
            vandString(string);
            }
        
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
        loopIter++;
    }

	close(); //Free allocated resources
	return 0;
}
        
void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship.gfxObj);
    freeGfxObject(&background.gfxObj);
    
    closeRenderer(); //Free resources and close SDL
}