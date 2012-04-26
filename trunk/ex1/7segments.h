#ifndef __7SEGMENTS_H__
#define __7SEGMENTS_H__

/*
 * driver's init function
 */
void segmentsInit();

/*
 * this function get a number and displays number%100 
 * on the seven segments screen
 */
void segmentsSetNumber(const char number); 

#endif

