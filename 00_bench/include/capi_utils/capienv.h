#ifndef CAPIENV_H
#define CAPIENV_H

#include <linux/types.h>
#include "myMalloc.h"
#include "graphCSR.h"
#include "libcxl.h"


// ********************************************************************************************
// ***************                  MMIO General 	                             **************
// ********************************************************************************************

#define ALGO_STATUS            0x3FFFFF8             // 0x3fffff8 >> 2 = 0xfffffe
#define ALGO_REQUEST           0x3FFFFF0             // 0x3fffff8 >> 2 = 0xfffffc
#define ERROR_REG              0x3FFFFE8
#define AFU_STATUS             0x3FFFFE0
#define ALGO_RUNNING           0x3FFFFD8

#define ALGO_STATUS_ACK  0x3FFFFD0
#define ERROR_REG_ACK    0x3FFFFC8

#define  ALGO_STATUS_DONE     0x3FFFFC0
#define  ALGO_STATUS_DONE_ACK 0x3FFFFB8

#ifdef  SIM
#define DEVICE_1              "/dev/cxl/afu0.0d"
#else
#define DEVICE_1              "/dev/cxl/afu0.0d"
#define DEVICE_2              "/dev/cxl/afu1.0d"
#endif

struct AFUStatus
{
    uint64_t algo_stop; // afu stopping condition
    uint64_t algo_status;
    uint64_t num_cu;
    uint64_t error;
    uint64_t afu_status;
    uint64_t algo_running;
    uint64_t algo_status_done;
};

// ********************************************************************************************
// ***************                      DataStructure                            **************
// ********************************************************************************************

struct __attribute__((__packed__)) WED
{
    __u32 size_send;                // 4-Bytes
    __u32 size_recive;              // 4-Bytes
    __u32 size3;                    // 4-Bytes
    void *array_send;               // 8-Bytes
    void *array_recive;             // 8-Bytes
    void *pointer1;                 // 8-Bytes
    void *pointer2;                 // 8-Bytes
    void *pointer3;                 // 8-Bytes
    void *pointer4;                 // 8-Bytes
    //---------------------------------------------------//
    void *pointer5;    // 8-Bytes  --// 64bytes
    //---------------------------------------------------//
    void *pointer6;                 // 8-Bytes
    void *pointer7;                 // 8-Bytes
    void *pointer8;                 // 8-Bytes
    void *pointer9;                 // 8-Bytes
    void *pointer10;                // 8-Bytes
    void *pointer11;                // 8-Bytes
    void *pointer12;                // 8-Bytes
    __u32 afu_config;               // 4-Bytes you can specify the read/write command to use the cache or not. 32-bit [0]-read [1]-write
}; // 108-bytes used from 128-Bytes WED;

// ********************************************************************************************
// ***************                        afu_config BIT-MAPPING                 **************
// ********************************************************************************************
 
 #define STRICT 0b000
 #define ABORT  0b001
 #define PAGE   0b010
 #define PREF   0b011
 #define SPEC   0b111

 #define READ_CL_S    0b1 // bit 31
 #define READ_CL_NA   0b0
 #define WRITE_MS     0b1
 #define WRITE_NA     0b0 // bit 30

// cu_vertex_job_control        5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [27:31] [4] [3] [0:2]
// cu_edge_job_control          5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [22:26] [9] [8] [5:7]
// cu_edge_data_control         5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [22:26] [14] [13] [10:12]
// cu_edge_data_write_control   5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [22:26] [19] [18] [15:17]

 #define AFU_CONFIG_STRICT_1  0x00000000  // 0b 00000 00000 00000 00000 00000 00000 00

// cu_vertex_job_control        5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [27:31] [4] [3] [0:2]
// cu_edge_job_control          5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [22:26] [9] [8] [5:7]
// cu_edge_data_control         5-bits STRICT | READ_CL_S  | WRITE_NA 00010 [22:26] [14] [13] [10:12]
// cu_edge_data_write_control   5-bits STRICT | READ_CL_NA | WRITE_MS 00001 [22:26] [19] [18] [15:17]

 #define AFU_CONFIG_STRICT_2  0x00041000  // 0b 00000 00000 00010 00001 00000 00000 00

// cu_vertex_job_control        5-bits ABORT | READ_CL_NA | WRITE_NA 10000 [27:31] [4] [3] [0:2]
// cu_edge_job_control          5-bits ABORT | READ_CL_NA | WRITE_NA 10000 [22:26] [9] [8] [5:7]
// cu_edge_data_control         5-bits ABORT | READ_CL_S  | WRITE_NA 10010 [22:26] [14] [13] [10:12]
// cu_edge_data_write_control   5-bits ABORT | READ_CL_NA | WRITE_MS 10001 [22:26] [19] [18] [15:17]

 #define AFU_CONFIG_ABORT_1  0x84251000  // 0b 10000 10000 10010 10001 00000 00000 00

// cu_vertex_job_control        5-bits PREF | READ_CL_NA | WRITE_NA 11000 [27:31] [4] [3] [0:2]
// cu_edge_job_control          5-bits PREF | READ_CL_NA | WRITE_NA 11000 [22:26] [9] [8] [5:7]
// cu_edge_data_control         5-bits PREF | READ_CL_NA | WRITE_NA 11000 [22:26] [14] [13] [10:12]
// cu_edge_data_write_control   5-bits PREF | READ_CL_NA | WRITE_NA 11000 [22:26] [19] [18] [15:17]

 #define AFU_CONFIG_PREF_1  0xC6318000  // 0b 11000 11000 11000 11000 00000 00000 00

// cu_vertex_job_control        5-bits PREF | READ_CL_NA | WRITE_NA 11000 [27:31] [4] [3] [0:2]
// cu_edge_job_control          5-bits PREF | READ_CL_NA | WRITE_NA 11000 [22:26] [9] [8] [5:7]
// cu_edge_data_control         5-bits PREF | READ_CL_S  | WRITE_NA 11010 [22:26] [14] [13] [10:12]
// cu_edge_data_write_control   5-bits PREF | READ_CL_NA | WRITE_MS 11001 [22:26] [19] [18] [15:17]

 #define AFU_CONFIG_PREF_2  0xC6359000 // 0b 11000 11000 11010 11001 00000 00000 00
 

 #define AFU_CONFIG AFU_CONFIG_STRICT_1

struct  WEDGraphCSR *mapGraphCSRToWED(struct GraphCSR *graph);
void printWEDGraphCSRPointers(struct  WEDGraphCSR *wed);

// ********************************************************************************************
// ***************                  MMIO General 	                             **************
// ********************************************************************************************

void printMMIO_error( uint64_t error );

// ********************************************************************************************
// ***************                  AFU General                                  **************
// ********************************************************************************************

int setupAFUGraphCSR(struct cxl_afu_h **afu, struct WEDGraphCSR *wedGraphCSR);
void startAFU(struct cxl_afu_h **afu, struct AFUStatus *afu_status);
void waitJOBRunning(struct cxl_afu_h **afu, struct AFUStatus *afu_status);
void waitAFU(struct cxl_afu_h **afu, struct AFUStatus *afu_status);
void releaseAFU(struct cxl_afu_h **afu);


#endif