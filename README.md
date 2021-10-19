### [Steps to run/build project]

#### => [1] Structure :
```bash
src       - source files 
python    - folder to generate inputs
rtl       - folder where verilog file are generated
quartus   - project for Quartus
Makefile  - basic commands to build and tun tests
build.sbt - project configuration
verilatorC++ - folder used to build C++ version of project
```

#### => [2] Basic commands ( from Makefile ):
```bash
-> git submodule init && git submodule update   - init all git dependencies
-> make build    - build project (configuration ) without proxy
-> make buildVM  - run with Intel proxy
-> make clean    - clean project
```

#### => [Run tests] :
```bash
make testAddSubPE
make testMultPE
make testMuxPE
make testPE
make testPE8
make testPE_CTRL
make testPE_8IP
make testPE_CTRL_8IP
```

#### => [Run C++ project] :
```bash
make verilatorTest
```