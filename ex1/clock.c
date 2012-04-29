#include "clock.h"

#define CLOCK_ADDR 0x100

void clockInit()
{
	clockSetTime(0);
}

void clockSetTime(const unsigned int time)
{
	_sr(time,CLOCK_ADDR);
}

unsigned int clockGetTime()
{
	return _lr(CLOCK_ADDR);
}
