.PHONY: build buildVM testVM test clean testAddSub verilatorTest show-config
default: build ;

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
	rm -rf project/target target test_run_dir generated diagram
	rm -rf rtl/*.json rtl/*.fir project/project python/__pycache__ 
	rm -rf cplusplus/*

testAddSubPE:
	sbt "testOnly modules.AddSubPE_test"

testMultPE:
	sbt "testOnly modules.MultPE_test"

testMuxPE:
	sbt "testOnly modules.MuxPE_test"

testPE:
	sbt "testOnly top.PE_test"

testPE8:
	sbt "testOnly top.PE_8_test"

testPE_CTRL:
	sbt "testOnly top.PE_CTRL_test"

testPE_8IP:
	sbt "testOnly top.PE_8IP_test"

testPE_CTRL_8IP:
	sbt "testOnly top_combo.PE_CTRL_8IP_test"


VERILATOR = verilator
VERILATOR_FLAGS =
# Generate C++ in executable form
VERILATOR_FLAGS += -cc 
# Optimize
VERILATOR_FLAGS += -Os -x-assign 0
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wall -Wno-lint
# Make waveforms
VERILATOR_FLAGS += --trace
# Check SystemVerilog asseshow-config:rtions
VERILATOR_FLAGS += --assert
# Run make to compile model, with as many CPUs as are free
VERILATOR_FLAGS += --build -j
# Run Verilator in debug mode
VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
VERILATOR_FLAGS += --gdbbt

verilatorConfig:
	$(VERILATOR) -V

verilatorTest:
	rm -rf cplusplus/*
	@echo
	@echo "-- Verilator Test"
	@echo
	@echo "-- COMPILE ----------------"
	@echo "-- PE_CTRL_8IP module"
	$(VERILATOR) $(VERILATOR_FLAGS) --Mdir cplusplus --exe verilatorC++/PE_CTRL_8IP_module/PE_CTRL_8IP_main.cpp rtl/PE_CTRL_8IP.v
	@echo
	@echo "-- RUN ---------------------"
	cplusplus/VPE_CTRL_8IP
	@echo
	@echo "-- DONE --------------------"