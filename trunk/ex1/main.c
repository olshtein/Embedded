#include "defs.h"
#include "7segments.h"
#include "clock.h"

UINT32 gInterval;
UINT32 gLastClockReading;
UINT32 gCounter;

#define COUNTER_INIT_VAL 0
#define INTERVAL_INIT_VAL 100

void updateCounter()
{
	++gCounter;
	segmentsSetNumber(gCounter);
}

void checkClock()
{
	UINT32 currentClock = clockGetTime();

	//check if the clock started another cycle or not
	if 	( 	
		//no clock overlap
		((currentClock > gLastClockReading) && (currentClock - gLastClockReading >= gInterval)) ||
		//clock overlaps
		((gLastClockReading > currentClock) && (currentClock + (MAX_UINT32 - gLastClockReading) >= gInterval)) 

		)
	{
		updateCounter();
		gLastClockReading = currentClock;
	}
}

void checkUart()
{
}

void initDrivers()
{
	clockInit();
	segmentsInit();
}

/*
 * init all programs component
 */
void init()
{
	initDrivers();

	//set init values
	gLastClockReading = clockGetTime();
	gInterval = INTERVAL_INIT_VAL;
	gCounter = COUNTER_INIT_VAL;

	segmentsSetNumber(gCounter);

}
void main(void)
{
	//init drivers and components
	init();

	while(TRUE)
	{
		//check if interval passed and the counter need to be update
		checkClock();
		//check if a request has arrived and handle it
		checkUart();
	
	}
}
