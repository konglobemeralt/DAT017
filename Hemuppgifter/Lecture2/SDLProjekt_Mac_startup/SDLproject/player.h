#ifndef PLAYER_H
#define PLAYER_H 

#include "gameobject.h"

extern GameObject ship;

void updateShip(GameObject* this);
void render(GameObject* this);
void createShip();

#endif