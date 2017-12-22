#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

#include "renderer.h"
#include "vecmath.h"

typedef struct {
    GfxObject   gfxObj;
    vec2f   pos;
    float   speed;
    double  angle, angleSpeed;
    float   scale, scaleSpeed;
    }GameObject;

#endif