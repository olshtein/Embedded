#include "LCD.h"
#include "common_defs.h"

#define LCD_DBUF_ADDR 0x1F0
#define LCD_DCMD_ADDR 0x1F1
#define LCD_DIER_ADDR 0x1F2
#define LCD_DICR_ADDR 0x1F3
#define BIT0 1
#define INIT_CHAR ' '

void (*gpFlushCompleteCB)(void);

//pack the struct with no internal spaces
#pragma pack(1)
typedef struct
{
	union
	{
		uint8_t data;
		struct
		{
			uint8_t charEncode	: 7;
			uint8_t selected	: 1;
		}byte;
	}info;
	
}LcdCharacter;

uint8_t gLcdData[LCD_LINE_LENGTH*LCD_NUM_LINES];

#pragma pack()



result_t lcd_init(void (*flush_complete_cb)(void))
{
	uint32_t i;
	_sr(0,LCD_DBUF_ADDR);
	_sr(0,LCD_DCMD_ADDR);
	_sr(0,LCD_DIER_ADDR);
	_sr(0,LCD_DICR_ADDR);

	if(!flush_complete_cb)
	{
        	return NULL_POINTER;
    	}
	//initilize the LCD screen data
	for(i=0 ; i<LCD_LINE_LENGTH*LCD_NUM_LINES ; ++i)
	{
		gLcdData[i] = INIT_CHAR;
	}
	
    	gpFlushCompleteCB = flush_complete_cb;

    	return OPERATION_SUCCESS;
}

result_t lcd_set_row(uint8_t row_number, bool selected, char const line[], uint8_t length)
{
	uint32_t i;
	if(!line)
	{
		return NULL_POINTER;
	}

	//note:row_number starts from 0
	if(length > LCD_LINE_LENGTH || row_number >= LCD_NUM_LINES)
	{
		return INVALID_ARGUMENTS;	
	}

	if(_lr(LCD_DCMD_ADDR))
	{	
		return NOT_READY;
	}

	if(length == 0)
	{
		return OPERATION_SUCCESS;
	}

	//note:row_number starts from 0
	uint32_t rowBytesOffset = LCD_LINE_LENGTH * row_number;
	
	//write the data to the gLcdData array
	for(i=0 ; i<length ; ++i)
	{	
		gLcdData[rowBytesOffset+i] = line[i];
	}

	//write the LCD data address to the DBUF register
	_sr((uint32_t)&gLcdData,LCD_DBUF_ADDR);

	//enable the DMA completion interrupt
	_sr(BIT0,LCD_DIER_ADDR);

	//start writing to the LCD display
	_sr(BIT0,LCD_DCMD_ADDR);

	return OPERATION_SUCCESS;
}

_Interrupt1 void lcdDisplayISR()
{	
	//disable the DMA completion interrupt
	_sr(0,LCD_DIER_ADDR);
	_sr(BIT0,LCD_DICR_ADDR);

	//call the CB function
	gpFlushCompleteCB();
}



