.PHONY: build buildVM testVM test clean testAddSub verilatorTest show-config
default: build ;

VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
VERILATOR_FLAGS =
# Generate C++ in executable form
VERILATOR_FLAGS += -cc 
# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD
# Optimize
VERILATOR_FLAGS += -Os -x-assign 0
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wall -Wno-lint
# Make waveforms
#VERILATOR_FLAGS += --trace
# Check SystemVerilog asseshow-config:rtions
VERILATOR_FLAGS += --assert
# Generate coverage analysis
#VERILATOR_FLAGS += --coverage
# Run make to compile model, with as many CPUs as are free
VERILATOR_FLAGS += --build -j
# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
#VERILATOR_FLAGS += --gdbbt
VERILATOR_FLAGS += --Mdir cplusplus --exe verilatorC++/AddSub_main.cpp
# Input files for Verilator
VERILATOR_INPUT = rtl/AddSub_Top.v

buildVM:
	sbt compile run -Dhttp.proxyHost=proxy-chain.intel.com -Dhttps.proxyHost=proxy-chain.intel.com -Dhttp.proxyPort=911 -Dhttps.proxyPort=911

testVM:
	rm -rf diagram
	sbt test -DwriteVcd=1 -Dhttp.proxyHost=proxy-chain.intel.com -Dhttps.proxyHost=proxy-chain.intel.com -Dhttp.proxyPort=911 -Dhttps.proxyPort=911

build:
	sbt compile run

test:
	rm -rf diagram
	sbt test -DwriteVcd=1

clean:
	rm -rf project/target rtl/ChiselTop.v rtl/Main.* quartus/db target test_run_dir generated diagram
	rm -rf rtl/*.json rtl/*.fir project/project python/__pycache__

testAddSub:
	rm -rf diagram
	sbt "testOnly modules.AddSub_test"

testMult:
	rm -rf diagram
	sbt "testOnly modules.Mult_test"

testrecFN2INT:
	rm -rf diagram
	sbt "testOnly other.recFN2INT_test"

testAddSubFull:
	sbt "testOnly modules.AddSub_test_full"

testEuclidean:
	sbt "testOnly top.PE_FPU_euclidean_test"

testDot:
	sbt "testOnly top.PE_FPU_dot_test"

test0:
	sbt "testOnly top.PE_FP32_test0"

show-config:
	$(VERILATOR) -V

verilatorTest:
	rm -rf cplusplus/*
	@echo
	@echo "-- Verilator coverage example"

	@echo
	@echo "-- VERILATE ----------------"
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)

	@echo
	@echo "-- RUN ---------------------"
	cplusplus/VAddSub_Top

	@echo
	@echo "-- DONE --------------------"