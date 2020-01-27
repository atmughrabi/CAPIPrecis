#########################################################
#              GENERAL DIRECTOIRES                      #
#########################################################
# globals binary S
export APP              = capi-precis

# test name
export APP_TEST         = test_capi-precis


# dirs Root app 
export APP_DIR          = .

#dir root/managed_folders
export SRC_DIR           = src
export OBJ_DIR           = obj
export INC_DIR           = include
export BIN_DIR           = bin

#if you want to compile from cmake you need this directory
#cd build
#cmake ..
export BUILD_DIR        = build

# relative directories used for managing src/obj files
export ALGO_DIR         = algorithms
export UTIL_DIR         = utils
export CAPI_UTIL_DIR    = capi_utils

#contains the tests use make run-test to compile what in this directory
export TEST_DIR         = tests

#contains the main for the app processing framework
export MAIN_DIR         = main


##############################################
# CAPI FPGA AFU PERFORMANCE CONFIG           #
##############################################

# STRICT 0b000
# ABORT  0b001
# PAGE   0b010
# PREF   0b011
# SPEC   0b111

# READ_CL_S    0b1
# READ_CL_NA   0b0
# WRITE_MS     0b1
# WRITE_NA     0b0

# // cu_read_engine_control            5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits STRICT | READ_CL_NA | WRITE_NA 00000 [5:9] [9] [8] [5:7]

# // 0b 00000 00000 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b00000000000000000000000000000000
export CU_CONFIG_MODE=0x00000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)$(TLB_SHIFT)$(TLB_SHIFT_DIRECTION)

# // cu_read_engine_control            5-bits ABORT | READ_CL_NA | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits ABORT | READ_CL_NA | WRITE_NA 00000 [5:9] [9] [8] [5:7]

# // 0b 10000 10000 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b10000100000000000000000000000000
# export CU_CONFIG_MODE=0x84000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits PREF | READ_CL_NA | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits PREF | READ_CL_NA | WRITE_NA 00000 [5:9] [9] [8] [5:7]

# // 0b 11000 11000 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b11000110000000000000000000000000
# export CU_CONFIG_MODE=0xC6000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits PAGE | READ_CL_NA | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits PAGE | READ_CL_NA | WRITE_NA 00000 [5:9] [9] [8] [5:7]

# // 0b 11000 11000 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b01000010000000000000000000000000
# export CU_CONFIG_MODE=0x42000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits SPEC | READ_CL_NA | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits SPEC | READ_CL_NA | WRITE_NA 00000 [5:9] [9] [8] [5:7]

# // 0b 11000 11000 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b11100111000000000000000000000000
# export CU_CONFIG_MODE=0xE7000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

##############################################
# With caches                                #
##############################################

# // cu_read_engine_control            5-bits STRICT | READ_CL_S | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits STRICT | READ_CL_NA | WRITE_MS 00000 [5:9] [9] [8] [5:7]

# export CU_CONFIG_MODE=0x10400$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)
# // 0b 00010 00001 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b00010000010000000000000000000000
# export CU_CONFIG_MODE=0x21000$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH) 

# // cu_read_engine_control            5-bits ABORT | READ_CL_S | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits ABORT | READ_CL_NA | WRITE_MS 00000 [5:9] [9] [8] [5:7]

# // 0b 10010 10001 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b10010100010000000000000000000000
# export CU_CONFIG_MODE=0x94400$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits PREF | READ_CL_S | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits PREF | READ_CL_NA | WRITE_MS 00000 [5:9] [9] [8] [5:7]

# // 0b 11010 11001 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b11010110010000000000000000000000
# export CU_CONFIG_MODE=0xD6400$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits PAGE | READ_CL_S | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits PAGE | READ_CL_NA | WRITE_MS 00000 [5:9] [9] [8] [5:7]

# // 0b 01010 01001 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b01010010010000000000000000000000
# export CU_CONFIG_MODE=0x52400$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

# // cu_read_engine_control            5-bits SPEC | READ_CL_S | WRITE_NA 00000 [0:4] [4] [3] [0:2]
# // cu_write_engine_control           5-bits SPEC | READ_CL_NA | WRITE_MS 00000 [5:9] [9] [8] [5:7]

# // 0b 11110 11101 00000 00000 00000 00000 00
# export CU_CONFIG_MODE=0b11110111010000000000000000000000
# export CU_CONFIG_MODE=0xF7400$(ENABLE_RD_WR)$(RD_WR_PREFETCH_MODE)$(ENABLE_RD_WR_PREFETCH)

##############################################
# CAPI FPGA TLB PREFETCH CONFIG              #
##############################################

# [32:35]
# [36:39]

# shift amount
TLB_SHIFT=0

#0 left | #1 right | example (2048 >> 1) 
TLB_SHIFT_DIRECTION=0

##############################################
# CAPI FPGA AFU PREFETCH CONFIG              #
##############################################

#disable both engines
# ENABLE_RD_WR=0
#enable read engine
# ENABLE_RD_WR=1
# enable write engine dependent (nothing to write)
# ENABLE_RD_WR=2
# enable write engine independent
# ENABLE_RD_WR=4
# enable both engines  dependent
ENABLE_RD_WR=3
#enable both engines independent
# ENABLE_RD_WR=5

#disable both PREFETCH
ENABLE_RD_WR_PREFETCH=0
#enable write PREFETCH
# ENABLE_RD_WR_PREFETCH=1
#enable read PREFETCH
# ENABLE_RD_WR_PREFETCH=2
#enable both PREFETCH
# ENABLE_RD_WR_PREFETCH=3

#disable both page address based
RD_WR_PREFETCH_MODE=0
#cacheline-read page-wrtie address based
# RD_WR_PREFETCH_MODE=1
# cacheline-write page-read address based
# RD_WR_PREFETCH_MODE=2
# both cacheline address based
# RD_WR_PREFETCH_MODE=3

##############################################
# CAPI FPGA AFU ARBITER CONFIG               #
##############################################
# shift credits >> 
# read_credits            [0:3]
# write_credits           [4:7]
# prefetch_read_credits   [8:11]
# prefetch_write_credits  [12:15]
# FIXED_ARB               [62]
# ROUND_ROBIN_ARB         [63]

ROUND_ROBIN_ARB=0x1111000000000001
FIXED_ARB=0x1111000000000002

##############################################
# CAPI FPGA AFU/CU      CONFIG               #
##############################################

export AFU_CONFIG_MODE=$(ROUND_ROBIN_ARB)
# export AFU_CONFIG_MODE=$(FIXED_ARB)

export CU_CONFIG_GENERIC=$(CU_CONFIG_MODE)
export AFU_CONFIG_GENERIC=$(AFU_CONFIG_MODE)

#########################################################
#                RUN  ARGUMENTS                         #
#########################################################

#1-128byte cacheline equal to 32 unsigned int type

export NUM_THREADS = 8
LHS=32 
RHS=2048
#test
export SIZE = $(shell echo $(LHS)\*$(RHS) | bc)

#32 GB 
# export SIZE = 8589934592

#16 GB
# export SIZE = 4294967296

#8 GB
# export SIZE = 1294967296

#4GB
# export SIZE = 1073741824

#2GB
# export SIZE = 536870912

#1GB
# export SIZE = 268435456

#512MB
# export SIZE = 134217728

#256
# export SIZE = 67108864

##################################################
export ARGS = -n $(NUM_THREADS) -s $(SIZE) -a $(AFU_CONFIG_GENERIC) -c $(CU_CONFIG_GENERIC) -m $(ENABLE_RD_WR)
##################################################

APP_DIR                 = .
MAKE_DIR                = 00_bench
MAKE_DIR_SYNTH          = 01_capi_integration/accelerator_synth

MAKE_NUM_THREADS        = $(shell grep -c ^processor /proc/cpuinfo)
MAKE_ARGS               = -w -C $(APP_DIR)/$(MAKE_DIR) -j$(MAKE_NUM_THREADS)
MAKE_ARGS_SYNTH         = -w -C $(APP_DIR)/$(MAKE_DIR_SYNTH) -j$(MAKE_NUM_THREADS)

##################################################
##################################################

##############################################
#               ACCEL TOP LEVEL RULES        #
##############################################

.PHONY: help
help:
	$(MAKE) help $(MAKE_ARGS)

.PHONY: run
run:
	$(MAKE) run $(MAKE_ARGS)

.PHONY: run-openmp
run-openmp:
	$(MAKE) run-openmp $(MAKE_ARGS)

.PHONY: debug-openmp
debug-openmp: 
	$(MAKE) debug-openmp $(MAKE_ARGS)

.PHONY: debug-memory-openmp
debug-memory-openmp: 
	$(MAKE) debug-memory-openmp $(MAKE_ARGS)

.PHONY: test-verbose
test-verbose:
	$(MAKE) test-verbose $(MAKE_ARGS)
	
# test files
.PHONY: test
test:
	$(MAKE) test $(MAKE_ARGS)
	
.PHONY: run-test
run-test: 
	$(MAKE) run-test $(MAKE_ARGS)

.PHONY: run-test-openmp
run-test-openmp:
	$(MAKE) run-test-openmp $(MAKE_ARGS)

.PHONY: debug-test-openmp
debug-test-openmp: 
	$(MAKE) debug-test-openmp $(MAKE_ARGS)

.PHONY: debug-memory-test-openmp
debug-memory-test-openmp:   
	$(MAKE) debug-memory-test-openmp $(MAKE_ARGS)
# cache performance
.PHONY: cachegrind-perf-openmp
cachegrind-perf-openmp:
	$(MAKE) cachegrind-perf-openmp $(MAKE_ARGS)

.PHONY: cache-perf
cache-perf-openmp: 
	$(MAKE) cache-perf-openmp $(MAKE_ARGS)

.PHONY: clean
clean: 
	$(MAKE) clean $(MAKE_ARGS)

.PHONY: clean-all
clean-all: clean clean-sim clean-synth

##################################################
##################################################

##############################################
#           ACCEL CAPI TOP LEVEL RULES      #
##############################################

.PHONY: run-capi-sim
run-capi-sim:
	$(MAKE) run-capi-sim $(MAKE_ARGS)

.PHONY: run-capi-fpga
run-capi-fpga:
	$(MAKE) run-capi-fpga $(MAKE_ARGS)

.PHONY: run-capi-sim-verbose
run-capi-sim-verbose:
	$(MAKE) run-capi-sim-verbose $(MAKE_ARGS)

.PHONY: run-capi-fpga-verbose
run-capi-fpga-verbose:
	$(MAKE) run-capi-fpga-verbose $(MAKE_ARGS)

.PHONY: capi
capi:
	$(MAKE) run-capi-fpga-verbose $(MAKE_ARGS) &&\
	sudo ./03_scripts/clear_cache.sh

.PHONY: run-test-capi
run-test-capi:
	$(MAKE) run-test-capi $(MAKE_ARGS)

.PHONY: run-vsim
run-vsim:
	$(MAKE) run-vsim $(MAKE_ARGS)

.PHONY: run-pslse
run-pslse:
	$(MAKE) run-pslse $(MAKE_ARGS)

.PHONY: build-pslse
build-pslse:
	  $(MAKE) build-pslse $(MAKE_ARGS)

.PHONY: clean-sim
clean-sim:
	 $(MAKE) clean-sim $(MAKE_ARGS)
##################################################
##################################################

##############################################
#           ACCEL SYNTHESIZE LEVEL RULES     #
##############################################

.PHONY: run-capi-synth
run-capi-synth:
	$(MAKE) all $(MAKE_ARGS_SYNTH)

.PHONY: run-capi-gui
run-capi-gui:
	$(MAKE) gui $(MAKE_ARGS_SYNTH)

.PHONY: run-capi-sweep
run-capi-sweep:
	$(MAKE) sweep $(MAKE_ARGS_SYNTH)

.PHONY: map
map:
	$(MAKE) map $(MAKE_ARGS_SYNTH)

.PHONY: fit
fit:
	$(MAKE) fit $(MAKE_ARGS_SYNTH)

.PHONY: asm
asm:
	$(MAKE) asm $(MAKE_ARGS_SYNTH)

.PHONY: sta
sta:
	$(MAKE) sta $(MAKE_ARGS_SYNTH)

.PHONY: qxp
qxp:
	$(MAKE) qxp $(MAKE_ARGS_SYNTH)

.PHONY: rbf
rbf:
	$(MAKE) rbf $(MAKE_ARGS_SYNTH)

.PHONY: smart
smart:
	$(MAKE) smart $(MAKE_ARGS_SYNTH)

.PHONY: program
program:
	$(MAKE) program $(MAKE_ARGS_SYNTH)

.PHONY: timing
timing:
	$(MAKE) timing $(MAKE_ARGS_SYNTH)

.PHONY: stats
stats:
	$(MAKE) stats $(MAKE_ARGS_SYNTH)

.PHONY: gen-rbf
gen-rbf:
	$(MAKE) gen-rbf $(MAKE_ARGS_SYNTH)

.PHONY:copy-rbf
copy-rbf:
	$(MAKE) copy-rbf $(MAKE_ARGS_SYNTH)

.PHONY: clean-synth
clean-synth:
	$(MAKE) clean $(MAKE_ARGS_SYNTH)
##################################################
##################################################