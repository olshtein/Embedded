#ifndef __CLOCK_H__
#define __CLOCK_H__

#include "defs.h"

void clockInit();
void clockSetTime(const UINT32 time);
UINT32 clockGetTime();

#endif

