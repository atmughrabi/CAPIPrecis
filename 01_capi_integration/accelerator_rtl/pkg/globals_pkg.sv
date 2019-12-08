// -----------------------------------------------------------------------------
//
//		"CAPIPrecis Shared Memory Accelerator Project"
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Abdullah Mughrabi atmughrabi@gmail.com/atmughra@ncsu.edu
// File   : globals_pkg.sv
// Create : 2019-09-26 15:20:15
// Revise : 2019-12-07 03:18:15
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------

package GLOBALS_AFU_PKG;


	parameter CREDITS_READ  = 32                          ;
	parameter CREDITS_WRITE = 32                          ;
	parameter CREDITS_TOTAL = CREDITS_READ + CREDITS_WRITE; // MUST be 64 credits max


////////////////////////////////////////////////////////////////////////////
// CU-Control CU Globals
////////////////////////////////////////////////////////////////////////////

// How many compute unites you want : each 1  contains N read/write engines
// TOTAL CUS = NUM_DATA_READ_CU_GLOBAL + NUM_DATA_WRITE_CU_GLOBAL
////////////////////////////////////////////////////////////////////////////

	parameter NUM_DATA_READ_CU_GLOBAL  = 8;
	parameter NUM_DATA_WRITE_CU_GLOBAL = 8;

	parameter CU_JOB_BUFFER_SIZE = 256;

////////////////////////////////////////////////////////////////////////////
//   CU-Control/AFU-Control CAPI Globals
////////////////////////////////////////////////////////////////////////////
	parameter PAGE_SIZE              = 65536                  ; // Pagesize default  is 64KB
	parameter PAGE_SIZE_BITS         = (PAGE_SIZE * 8)        ;
	parameter CACHELINE_SIZE         = 128                    ; // cacheline is 128bytes
	parameter CACHELINE_SIZE_BITS    = (CACHELINE_SIZE * 8)   ;
	parameter CACHELINE_SIZE_HF      = (CACHELINE_SIZE >> 1)  ; // cacheline is 64bytes
	parameter CACHELINE_SIZE_BITS_HF = (CACHELINE_SIZE_HF * 8);

	parameter WORD             = 4              ;
	parameter WORD_BITS        = WORD * 8       ;
	parameter WORD_DOUBLE      = WORD * 2       ;
	parameter WORD_DOUBLE_BITS = WORD_DOUBLE * 8;

////////////////////////////////////////////////////////////////////////////
// AFU-Control (Buffer sizes)
////////////////////////////////////////////////////////////////////////////

	parameter TAG_COUNT   = 256  ;
	parameter INVALID_TAG = 8'h00;

	parameter BURST_CMD_BUFFER_SIZE = 32; // size of command burst for PSL leave as is

	parameter READ_CMD_BUFFER_SIZE           = 128;
	parameter WRITE_CMD_BUFFER_SIZE          = 128;
	parameter PREFETCH_READ_CMD_BUFFER_SIZE  = 128;
	parameter PREFETCH_WRITE_CMD_BUFFER_SIZE = 128;
	parameter RESTART_CMD_BUFFER_SIZE        = 4  ;
	parameter WED_CMD_BUFFER_SIZE            = 4  ;

	parameter READ_RSP_BUFFER_SIZE           = 128;
	parameter PREFETCH_READ_RSP_BUFFER_SIZE  = 128;
	parameter PREFETCH_WRITE_RSP_BUFFER_SIZE = 128;
	parameter WRITE_RSP_BUFFER_SIZE          = 128;
	parameter RESTART_RSP_BUFFER_SIZE        = 4  ;
	parameter WED_RSP_BUFFER_SIZE            = 4  ;

	parameter READ_DATA_BUFFER_SIZE    = 128;
	parameter WRITE_DATA_BUFFER_SIZE   = 128;
	parameter RESTART_DATA_BUFFER_SIZE = 4  ;
	parameter WED_DATA_BUFFER_SIZE     = 4  ;

////////////////////////////////////////////////////////////////////////////
// AFU-Control (Buffer Priorities) for Arbitration
////////////////////////////////////////////////////////////////////////////

	parameter PRIORITY_RESTART = 0;
	parameter PRIORITY_WED     = 1;

	parameter PRIORITY_WRITE = 2;
	parameter PRIORITY_READ  = 3;

	parameter PRIORITY_PREFTECH_WRITE = 4;
	parameter PRIORITY_PREFETCH_READ  = 5;

////////////////////////////////////////////////////////////////////////////
// CU-Control  (Buffer size)
////////////////////////////////////////////////////////////////////////////

	parameter WRITE_ENGINE_BUFFER_HEADROOM = READ_CMD_BUFFER_SIZE + BURST_CMD_BUFFER_SIZE + CREDITS_READ;
	parameter WRITE_ENGINE_BUFFER_SIZE     = 2 ** ($clog2(WRITE_ENGINE_BUFFER_HEADROOM) + 1)            ;

////////////////////////////////////////////////////////////////////////////
// AFU-Control MMIO Registers Mapping on AFU and HOSt
////////////////////////////////////////////////////////////////////////////

	parameter ALGO_STATUS  = 26'h 3FFFFF8 >> 2; // algorithm status DONE/RUNNING HOST reads this address
	parameter ALGO_REQUEST = 26'h 3FFFFF0 >> 2; // algorithm status START/STOP/RESET AFU reads this address
	parameter ERROR_REG    = 26'h 3FFFFE8 >> 2; // AFU error reporting HOST reads this address
	parameter AFU_STATUS   = 26'h 3FFFFE0 >> 2; // AFU status job running
	parameter ALGO_RUNNING = 26'h 3FFFFD8 >> 2; // KERNEL RETURN

	parameter ALGO_STATUS_ACK = 26'h 3FFFFD0 >> 2;
	parameter ERROR_REG_ACK   = 26'h 3FFFFC8 >> 2;

	parameter ALGO_STATUS_DONE     = 26'h 3FFFFC0 >> 2;
	parameter ALGO_STATUS_DONE_ACK = 26'h 3FFFFB8 >> 2;

	parameter DONE_COUNT_REG                = 26'h 3FFFFB0 >> 2;
	parameter DONE_RESTART_COUNT_REG        = 26'h 3FFFFA8 >> 2;
	
	parameter PAGED_COUNT_REG   = 26'h 3FFFFA0 >> 2;
	parameter FLUSHED_COUNT_REG = 26'h 3FFFF98 >> 2;
	parameter AERROR_COUNT_REG  = 26'h 3FFFF90 >> 2;
	parameter DERROR_COUNT_REG  = 26'h 3FFFF88 >> 2;
	parameter FAILED_COUNT_REG  = 26'h 3FFFF80 >> 2;
	parameter FAULT_COUNT_REG   = 26'h 3FFFF78 >> 2;
	parameter NRES_COUNT_REG    = 26'h 3FFFF70 >> 2;
	parameter NLOCK_COUNT_REG   = 26'h 3FFFF68 >> 2;

	parameter CYCLE_COUNT_REG      = 26'h 3FFFF58 >> 2;
	parameter DONE_READ_COUNT_REG  = 26'h 3FFFF50 >> 2;
	parameter DONE_WRITE_COUNT_REG = 26'h 3FFFF48 >> 2;
	parameter DONE_PREFETCH_READ_COUNT_REG  = 26'h 3FFFF60 >> 2;
	parameter DONE_PREFETCH_WRITE_COUNT_REG = 26'h 3FFFF40 >> 2;



////////////////////////////////////////////////////////////////////////////
// CU-Control CU Globals
////////////////////////////////////////////////////////////////////////////

//  Sturctue sizes
////////////////////////////////////////////////////////////////////////////

	parameter ARRAY_SIZE           = 4                  ; // array size is n bytes
	parameter ARRAY_SIZE_BITS      = ARRAY_SIZE * 8     ; // array size is n*8 Bits
	parameter DATA_SIZE_READ       = 8                  ; // edge data size is n bytes
	parameter DATA_SIZE_READ_BITS  = DATA_SIZE_READ * 8 ; // edge data size is n*8 Bits
	parameter DATA_SIZE_WRITE      = 8                  ; // edge data size is n bytes
	parameter DATA_SIZE_WRITE_BITS = DATA_SIZE_WRITE * 8; // edge data size is n*8 Bits

// aligenment to cacheline 128-BYTES
	parameter [0:63] ADDRESS_ARRAY_ALIGN_MASK = {{57{1'b1}},{7{1'b0}}};
	parameter [0:63] ADDRESS_ARRAY_MOD_MASK   = {{57{1'b0}},{7{1'b1}}};

	parameter [0:63] ADDRESS_DATA_READ_ALIGN_MASK = {{57{1'b1}},{7{1'b0}}};
	parameter [0:63] ADDRESS_DATA_READ_MOD_MASK   = {{57{1'b0}},{7{1'b1}}};

	parameter [0:63] ADDRESS_DATA_WRITE_ALIGN_MASK = {{57{1'b1}},{7{1'b0}}};
	parameter [0:63] ADDRESS_DATA_WRITE_MOD_MASK   = {{57{1'b0}},{7{1'b1}}};

	parameter CACHELINE_ARRAY_NUM        = (CACHELINE_SIZE >> $clog2(ARRAY_SIZE))                                                               ; // number of  in one cacheline                                                                ; // number of edges in one cacheline
	parameter CACHELINE_INT_COUNTER_BITS = $clog2((ARRAY_SIZE_BITS < CACHELINE_SIZE_BITS_HF) ? (2 * CACHELINE_SIZE_BITS_HF)/ARRAY_SIZE_BITS : 2);

	parameter PAGE_ARRAY_NUM        = (PAGE_SIZE >> $clog2(ARRAY_SIZE))                                                               ; // number of  in one cacheline                                                                ; // number of edges in one cacheline
	

////////////////////////////////////////////////////////////////////////////
//  AFU-Control CU IDs any compute unite that generate command must have an ID
////////////////////////////////////////////////////////////////////////////

	parameter CU_ID_RANGE = 8;

	parameter INVALID_ID = {CU_ID_RANGE{1'b0}};
	parameter WED_ID     = {CU_ID_RANGE{1'b1}};
	parameter RESTART_ID = (WED_ID - 1)       ;

////////////////////////////////////////////////////////////////////////////
//  CU-Control CU IDs any compute unite that generate command must have an ID
////////////////////////////////////////////////////////////////////////////

	parameter PREFETCH_READ_CONTROL_ID  = (RESTART_ID - 1)              ;
	parameter PREFETCH_WRITE_CONTROL_ID = (PREFETCH_READ_CONTROL_ID - 1);


	parameter DATA_READ_CONTROL_ID  = (PREFETCH_WRITE_CONTROL_ID - 1);
	parameter DATA_WRITE_CONTROL_ID = (DATA_READ_CONTROL_ID - 1)     ;


	typedef logic [0:(CU_ID_RANGE-1)] cu_id_t;

endpackage