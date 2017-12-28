#ifndef ALIEN_H
#define ALIEN_H 

#include "gameobject.h"

extern GameObject alien;

void updateAlien(GameObject* this);
void render(GameObject* this);
void createAlien();

#endif