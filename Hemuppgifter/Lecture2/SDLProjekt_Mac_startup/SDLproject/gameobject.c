#include "gameobject.h"

GameObject* gameObjects[20];
int nGameObjects = 0;

void render(GameObject* this) {
	renderGfxObject(&this->gfxObj, this->pos.x , this->pos.y, this->angle, this->scale);
}