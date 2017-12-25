#ifndef BACKGROUND_H
#define BACKGROUND_H

#include "gameobject.h"

extern GameObject background;
void updateBackground(GameObject* this);
void render(GameObject* this);
void createBackground();

#endif