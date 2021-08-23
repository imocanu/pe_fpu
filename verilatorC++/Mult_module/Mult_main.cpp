#include "VMult.h"
#include "verilated.h"
#include <iostream>
using namespace std;
#include <sstream>
#include <bitset>

// https://peter.bloomfield.online/convert-a-number-to-a-binary-string-and-back-in-cpp/

vluint64_t main_time = 0;
double sc_time_stamp() {
    return main_time;  // Note does conversion to real, to match SystemC
}

int main(int argc, char **argv, char **env) {
    Verilated::debug(0);
    Verilated::randReset(2);
    Verilated::traceEverOn(true);
    Verilated::commandArgs(argc, argv);
    Verilated::mkdir("logs");

    Verilated::commandArgs(argc, argv);
    VMult* top = new VMult;

    top->clock = 0;
    top->reset = 0;
    //top->io_op = 0;

    // def round_near_even   = "b000".asUInt(3.W)
    // def round_minMag      = "b001".asUInt(3.W)
    // def round_min         = "b010".asUInt(3.W)
    // def round_max         = "b011".asUInt(3.W)
    // def round_near_maxMag = "b100".asUInt(3.W)
    // def round_odd         = "b110".asUInt(3.W)
    top->io_round = 0b111;
    top->io_useINT = 1; 

    //vluint32_t in1 = vl_sys_rand32();
    //top->io_in1 = VerilatedContextImp.randSeedDefault64(); 
    // strtoull("01000010111000000000000000000000", NULL, 2); 
    // VL_RANDOM_SEEDED_II(32, 0);
    //top->io_in2 = VerilatedContextImp.randSeedDefault64();

    for (size_t i=0; i<1; i++) {
        top->reset = 1;
        top->clock = 0;
        top->eval();
        top->clock = 1;
        top->eval();
    }
   top->reset = 0;

    vluint32_t test1 = 0b11111111111111111110010010010111; // 0b00000000000000000000000000000110; // 0x00000006;    
    vluint32_t test2 = 0b11111111111111111010000000110100; 
    top->io_in1 = test1;
    top->io_in2 = test2;
    
    while (!Verilated::gotFinish()) 
    {
        if ((main_time % 10) == 1) 
        {
            top->clock = 1; 
        }
        if ((main_time % 10) == 6) 
        {
            top->clock = 0;
        }

        top->eval(); 
        top->eval_step(); 

        cout << "tick " << main_time << endl;
        cout << "OUT:" << std::bitset<32>( top->io_out ).to_string() << endl;
        main_time++;

        if (main_time == 50) 
        {
            VL_PRINTF("Test done\n");
            Verilated::gotFinish(true);
            Verilated::flushCall();
        }

    }
    top->final();
    delete top;
    top = NULL;
    exit(0);
}