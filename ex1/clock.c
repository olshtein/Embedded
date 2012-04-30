#include "clock.h"
#include "defs.h"

#define CLOCK_ADDR 0x100

void clockInit()
{
	clockSetTime(0);
}

void clockSetTime(const UINT32 time)
{
	_sr(time,CLOCK_ADDR);
}

UINT32 clockGetTime()
{
	return _lr(CLOCK_ADDR);
}
