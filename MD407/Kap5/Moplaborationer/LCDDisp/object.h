#ifndef OBJECT_H
#define OBJECT_H

#define MAX_POINTS 20;

typedef struct tPoint{
    unsigned char x;
    unsigned char y;
    }POINT;
    
    
typedef struct tGeometry{
    int numpoints;
    int sizeX;
    int sizeY;
    POINT px[MAX_POINTS];
    } GEOMETRY, *PGEOMETRY;
    
typedef struct tObj{
    PGEOMETRY geo;
    int dirX, dirY;
    int posX, posY;
    void (* draw) (struct tObj*);
    void (* clear) (struct tObj*);
    void (* move) (struct tObj*);
    void (* set_speed) (struct tObj*, int, int);
    } OBJECT, *POBJECT;
    
    
void set_object_object(POBJECT pObj, int speedX, int speedY){
        pObj->dirX = x;
        pObj->dirY = y;
    }
    
void draw_object(POBJECT pObj){
    for(int i=0; i < MAX_POINTS; i++){
        
        
        }
    
    }

#endif