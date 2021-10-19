### [Steps to run/build project]

#### => [1] Structure :
src      - source file 
python   - folder to generate inputs
rtl      - folder where verilog file are generated
Makefile  - basic commands to build and tun tests
build.sbt - project configuration
verilatorC++ - folder used to build C++ version of project

#### => [2] Basic commands ( from Makefile ):
-> git submodule init && git submodule update - init all git dependencies
( module berkeley-hardfloat will be downloaded )
-> make build    - build project (configuration )
    -> choose what module to compile  ( id number )
-> make buildVM  - when is run on a remote machine inside Intel network
-> make clean    - clean project

#### => [Run tests] :
make testAddSubPE
make testMultPE
make testMuxPE
make testPE
make testPE8
make testPE_CTRL
make testPE_8IP
make testPE_CTRL_8IP

#### => [Run C++ project] :
make verilatorTest