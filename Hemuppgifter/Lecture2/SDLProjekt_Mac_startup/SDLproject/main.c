#include "renderer.h"
#include <stdio.h>
#include <math.h>

#define WINDOW_WIDTH 800 
#define WINDOW_HEIGHT 600

GfxObject ship, background;

void close(); 

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
	// Start up SDL and create window of width=800, height = 600
	initRenderer(WINDOW_WIDTH, WINDOW_HEIGHT); 
    
    // Create an object
    ship = createGfxObject(  "../ship.png" );
    ship.outputWidth  = 200;
    ship.outputHeight = 200;
    int shipXpos = 400, shipYpos = 300, ShipSpeed = 3;
    float shipRot = 0;
    int *px = &shipXpos, *py = &shipYpos; 
    
    background = createGfxObject( "../background.jpg" );
    background.outputWidth = WINDOW_WIDTH;
    background.outputHeight = WINDOW_HEIGHT;
    //Background angle osv
    float backgroundRotAngle = 0;
    float backgroundZoomLevel = 1;
    
    
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
                    *px = (*px+ShipSpeed >= 799) ? 799 :  *px+ShipSpeed;
                }
                
            if (state[SDL_SCANCODE_A]) {
                    *px = (*px-ShipSpeed <= 0) ? 0 :  *px-ShipSpeed;
            }
                
                if (state[SDL_SCANCODE_S]) {
                    *py = (*py+ShipSpeed >= 599) ? 599 :  *py+ShipSpeed;
            }
                
                if (state[SDL_SCANCODE_W]) {
                    *py = (py-ShipSpeed <= 0) ? 0 :  *py-ShipSpeed;
            }
            
               if (state[SDL_SCANCODE_E]) {
                    shipRot = fmod(shipRot + 0.2, 360);
            }
            
               if (state[SDL_SCANCODE_Q]) {
                    shipRot = fmod(shipRot - 0.2, -360);
            }
            
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Render our object(s) - background objects first, and then forward objects (like a painter)
        renderGfxObject(&background, 400, 300, backgroundRotAngle, backgroundZoomLevel);
        renderGfxObject(&ship, shipXpos, shipYpos, shipRot, 1.0f);
        renderText("Hello World!", 300, 150);
        
        //update rotation
        backgroundRotAngle = fmod(backgroundRotAngle +0.03, 360);
        backgroundZoomLevel += 0.001;
        
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
    }

	close(); //Free allocated resources
	return 0;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship);
    
    closeRenderer(); //Free resources and close SDL
}