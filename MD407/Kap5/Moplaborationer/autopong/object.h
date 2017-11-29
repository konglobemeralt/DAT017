#ifndef OBJECT_H
#define OBJECT_H

#define MAX_POINTS 20

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
    
    
void set_object_speed(POBJECT pObj, int speedX, int speedY){
        pObj->dirX = speedX;
        pObj->dirY = speedY;
    }
    
void draw_object(POBJECT pObj){
    for(int i=0; i < MAX_POINTS; i++){
            pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 1);
        }
    }

void clear_object(POBJECT pObj){
    for(int i=0; i < MAX_POINTS; i++){
            pixel(pObj->geo->px[i].x + pObj->posX, pObj->geo->px[i].y + pObj->posY, 0);
        }
    }
    
void move_object(POBJECT pObj){
    clear_object(pObj);
    pObj->posX += pObj->dirX;
    pObj->posY += pObj->dirY;
    
    if((pObj->posX < 0) || pObj->posX > 127 ) {
		pObj->dirX = -pObj->dirX;
	}
    
	if((pObj->posY < 0) || pObj->posY > 63 ) {
		pObj->dirY = -pObj->dirY;
	}
    
	pObj->draw(pObj);
    
    }    


#endif