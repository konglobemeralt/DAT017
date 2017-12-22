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

int t = 0;
bool bShake = false;
int shakeStop = 0;

void close();

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
    ship.pos.x = 400;
    ship.pos.y = 300;
    ship.angle = 0;
    ship.angleSpeed = 0.2;
    
    background.gfxObj = createGfxObject( "../background.jpg" );
    background.gfxObj.outputWidth = WINDOW_WIDTH;
    background.gfxObj.outputHeight = WINDOW_HEIGHT;
    //Background angle osv
    background.angle = 0;
    background.scale = 1;
    
    char string[] = "Hello World!";
    int loopIter = 0;
    
    // get pointer to key states
    const Uint8 *state = SDL_GetKeyboardState(NULL); 
    
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
            
              if (state[SDL_SCANCODE_D]) {
                    ship.pos.x = (ship.pos.x+ship.speed >= 799) ? 799 :  ship.pos.x+ship.speed;
                }
                
            if (state[SDL_SCANCODE_A]) {
                    ship.pos.x = (ship.pos.x-ship.speed <= 0) ? 0 :  ship.pos.x-ship.speed;
            }
                
                if (state[SDL_SCANCODE_S]) {
                    ship.pos.y = (ship.pos.y+ship.speed >= 599) ? 599 :  ship.pos.y+ship.speed;
            }
                
                if (state[SDL_SCANCODE_W]) {
                    ship.pos.y = (ship.pos.y-ship.speed <= 0) ? 0 :  ship.pos.y-ship.speed;
            }
            
               if (state[SDL_SCANCODE_E]) {
                    ship.angle = fmod(ship.angle + ship.angleSpeed, 360);
            }
            
               if (state[SDL_SCANCODE_Q]) {
                    ship.angle = fmod(ship.angle - ship.angleSpeed, -360);
            }
            
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        shake(&ship.pos);

        // Render our object(s) - background objects first, and then forward objects (like a painter)
        renderGfxObject(&background.gfxObj, 400, 300, background.angle, background.scale);
        renderGfxObject(&ship.gfxObj, ship.pos.x, ship.pos.y, ship.angle, 1.0f);
        renderText(string, 300, 150);
        
        //update rotation
        background.angle = fmod(background.angle +0.03, 360);
        background.scale += 0.001;
        
        
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
    
    closeRenderer(); //Free resources and close SDL
}