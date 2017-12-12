#include "object.h"
#include "paddle.h"


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
        move_object,
        set_object_speed
};

void move(POBJECT this) {
	clear_object(this);
	this->draw(this);
}