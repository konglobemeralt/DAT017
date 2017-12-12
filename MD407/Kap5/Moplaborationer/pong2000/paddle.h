extern OBJECT Rpaddle;
extern OBJECT Lpaddle;

void move_paddle(POBJECT this) {
	clear_object(this);
	
	this->posY += this->dirY;
	
	if(this->posY < 0) {
		this->posY = 0;
	} else if(this->posY + this->geo->sizeY > 127) {
		this->posY = 127 - this->geo->sizeY;
	}
	
	this->draw(this);
}

GEOMETRY paddle_geometry = {
	75,
	2, 25,
	{
        {0, 1}, {0, 2}, {0, 3}, {0, 4}, {0, 5},
        {0, 6}, {0, 7}, {0, 8}, {0, 9}, {0, 10},
        {0, 11}, {0, 12}, {0, 13}, {0, 14}, {0, 15},
        {0, 16}, {0, 17}, {0, 18}, {0, 19}, {0, 20},
        {0, 21}, {0, 22}, {0, 23}, {0, 24}, {0, 25},
        
        {1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5},
        {1, 6}, {1, 7}, {1, 8}, {1, 9}, {1, 10},
        {1, 11}, {1, 12}, {1, 13}, {1, 14}, {1, 15},
        {1, 16}, {1, 17}, {1, 18}, {1, 19}, {1, 20},
        {1, 21}, {1, 22}, {1, 23}, {1, 24}, {1, 25},
        
        {2, 1}, {2, 2}, {2, 3}, {2, 4}, {2, 5},
        {2, 6}, {2, 7}, {2, 8}, {2, 9}, {2, 10},
        {2, 11}, {2, 12}, {2, 13}, {2, 14}, {2, 15},
        {2, 16}, {2, 17}, {2, 18}, {2, 19}, {2, 20},
        {2, 21}, {2, 22}, {2, 23}, {2, 24}, {2, 25},
      
	}
};
    
OBJECT Rpaddle =
{
        &paddle_geometry, //geometri
        0, 0,           //init direction
        120, 1,           //start init
        draw_object,
        clear_object,
        move_paddle,
        set_object_speed
};

OBJECT Lpaddle =
{
        &paddle_geometry, //geometri
        0, 0,           //init direction
        1, 1,           //start init
        draw_object,
        clear_object,
        move_paddle,
        set_object_speed
};
