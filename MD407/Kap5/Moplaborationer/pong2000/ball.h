#include "object.h"
#include "paddle.h"

void move_ball(POBJECT this) {
	
    this->posX += this->dirX;
	this->posY += this->dirY;
	
	//if((this->posY < 0) ||  this->posY > 63 ) {
	//	this->dirY = -this->dirY;
	//}
	
	// Define left and right paddle
	POBJECT lp = &Lpaddle;
	POBJECT rp = &Rpaddle;
	
	//Rpaddle collision
	if(this->posX <= lp->posX + lp->geo->sizeX) {
		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
			this->dirX = -this->dirX;
		} else {
			//Print ascii string to show score
		}
	}
	
	//Lpaddle collision
	if(this->posX >= rp->posX) {
		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
			this->dirX = -this->dirX;
		} else {
			//Print ascii string to show score
		}
	}
	
	this->draw(this);
}

GEOMETRY ball_geometry = {
	12,
	4, 4,
	{
		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
		{3, 1},
		{3, 2}
	}
};
    
OBJECT ball =
{
        &ball_geometry, //geometri
        0, 0,           //init direction
        1, 1,           //start init
        draw_object,
        clear_object,
        move_ball,
        set_object_speed
};