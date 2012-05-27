#include "network.h"

#define NETWORK_BASE_ADDR 0x200000

//pack the struct with no internal spaces
#pragma pack(1)
typedef struct
{
	uint32_t NTXBP;
	uint32_t NTXBL;
	uint32_t NTXFH;
	uint32_t NTXFT;
	uint32_t NRXBP;
	uint32_t NRXL;
	uint32_t NRXFH;
	uint32_t NRXFT;
	
	union
    {
		uint32_t data;
		struct
        {
			uint8_t NBSY							:1;
			uint8_t EnableTxInterrupt				:1;
			uint8_t EnableRxInterrupt				:1;
			uint8_t EnablePacketDroppedInterrupt	:1;
			uint8_t EnableTransmitErrorInterrupt	:1;
			uint32_t reserved						:24;
			union
			{
				uint8_t data 						:3;
				struct
                {
                        uint8_t normal      		:1;
                        uint8_t SmscConnectivity    :1;
                        uint8_t internalLoopback   	:1;
                }bits;
			}NOM;
	}NCTRL;
	
	union
    {
		uint32_t data;
		struct
        {
			uint8_t NTIP				:1;
			uint8_t reserved			:1;
			uint8_t NRIP				:1;
			uint8_t NROR				:1;
			uint8_t reserved			:4;
			union
			{
				uint8_t data;
				struct
                {
                        uint8_t RxComplete      	:1;
                        uint8_t TxComplete      	:1;
                        uint8_t RxBufferTooSmall   	:1;
                        uint8_t CircularBufferFulll	:1;
                        uint8_t TxBadDescriptor  	:1;   
                        uint8_t TxNetworkError     	:1;    
                        uint8_t reserved           	:2;    						
                }bits;
			}NIRE;
			uint16_t reserved			:16;
	}NSTAT;
} volatile NetworkRegs;
#pragma pack()


uint32_t gNetworkData[NETWORK_MAXIMUM_TRANSMISSION_UNIT];
network_operating_mode_t gNetworkOperMode;
network_init_params_t gNetworkParams;

result_t network_init(const network_init_params_t *init_params)
{
        if(!init_params)
        {
                return NULL_POINTER;
        }
//      if()
//      return INVALID_ARGUMENTS;

        gNetworkParams = *init_params;
        return OPERATION_SUCCESS;
}

result_t network_set_operating_mode(network_operating_mode_t new_mode)
{
        //      if()
        //      return INVALID_ARGUMENTS;

        gNetworkOperMode = new_mode;
        return OPERATION_SUCCESS;
}

result_t network_send_packet_start(const uint8_t buffer[], uint32_t size, uint32_t length)
{
        if(!buffer)
        {
                return NULL_POINTER;
        }

        if(length < 0 || length > NETWORK_MAXIMUM_TRANSMISSION_UNIT || size < length){
                return INVALID_ARGUMENTS;
        }

        if(length == 0)
        {
                return OPERATION_SUCCESS;
        }


//      if()
//      return NETWORK_TRANSMIT_BUFFER_FULL;

        return OPERATION_SUCCESS;
}

