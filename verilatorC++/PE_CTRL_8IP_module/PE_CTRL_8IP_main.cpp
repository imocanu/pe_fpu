#include "VPE_CTRL_8IP.h"
#include "verilated.h"
#include <iostream>
using namespace std;
#include <sstream>
#include <bitset>

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
    VPE_CTRL_8IP* top = new VPE_CTRL_8IP;

    top->clock = 0;
    top->reset = 0;

    for (size_t i=0; i<10; i++) {
        top->reset = 1;
        top->clock = 0;
        top->eval();
        top->clock = 1;
        top->eval();
    }

    top->reset = 0;

    top->io_op_type  = 0b00;
    top->io_use_int  = 0b1;
    top->io_tininess = 0b1;
    top->io_rounding = 0b100; 

    vluint32_t int32_0 = 0b00000000000000000000000000010111; // 23
    vluint32_t int32_1 = 0b00000000000000000000000000001011; // 11
    vluint32_t int32_2 = 0b11111111111111111111111111001001; // -55
    vluint32_t int32_3 = 0b11111111111111111111111111110101; // -11

    vluint32_t fp32_0 = 0b01000001101110000000000000000000; // 23
    vluint32_t fp32_1 = 0b01000001001100000000000000000000; // 11
    vluint32_t fp32_2 = 0b11000010010111000000000000000000; // -55
    vluint32_t fp32_3 = 0b11000001001100000000000000000000; // -11


    top->io_Xi_0_in_0 = int32_0;
    top->io_Yi_0_in_0 = int32_1;
    top->io_Xi_0_in_1 = int32_2;
    top->io_Yi_0_in_1 = int32_3;

    top->io_Xi_1_in_0 = int32_0;
    top->io_Yi_1_in_0 = int32_1;
    top->io_Xi_1_in_1 = int32_2;
    top->io_Yi_1_in_1 = int32_3;

    top->io_Xi_2_in_0 = int32_0;
    top->io_Yi_2_in_0 = int32_1;
    top->io_Xi_2_in_1 = int32_2;
    top->io_Yi_2_in_1 = int32_3;

    top->io_Xi_3_in_0 = int32_0;
    top->io_Yi_3_in_0 = int32_1;
    top->io_Xi_3_in_1 = int32_2;
    top->io_Yi_3_in_1 = int32_3;
    
    top->io_Xi_4_in_0 = int32_0;
    top->io_Yi_4_in_0 = int32_1;
    top->io_Xi_4_in_1 = int32_2;
    top->io_Yi_4_in_1 = int32_3;

    top->io_Xi_5_in_0 = int32_0;
    top->io_Yi_5_in_0 = int32_1;
    top->io_Xi_5_in_1 = int32_2;
    top->io_Yi_5_in_1 = int32_3;

    top->io_Xi_6_in_0 = int32_0;
    top->io_Yi_6_in_0 = int32_1;
    top->io_Xi_6_in_1 = int32_2;
    top->io_Yi_6_in_1 = int32_3;

    top->io_Xi_7_in_0 = int32_0;
    top->io_Yi_7_in_0 = int32_1;
    top->io_Xi_7_in_1 = int32_2;
    top->io_Yi_7_in_1 = int32_3;

    VL_PRINTF("Run test for INT32 ...\n");

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

        main_time++;

        if (main_time == 222) 
        {
            cout << "out_1 : " << std::bitset<32>( top->io_out ).to_string() << endl;
            
            VL_PRINTF("Test done\n");
            Verilated::gotFinish(true);
        }
    }

    top->io_use_int  = 0b0;

    top->io_Xi_0_in_0 = fp32_0;
    top->io_Yi_0_in_0 = fp32_1;
    top->io_Xi_0_in_1 = fp32_2;
    top->io_Yi_0_in_1 = fp32_3;

    top->io_Xi_1_in_0 = fp32_0;
    top->io_Yi_1_in_0 = fp32_1;
    top->io_Xi_1_in_1 = fp32_2;
    top->io_Yi_1_in_1 = fp32_3;

    top->io_Xi_2_in_0 = fp32_0;
    top->io_Yi_2_in_0 = fp32_1;
    top->io_Xi_2_in_1 = fp32_2;
    top->io_Yi_2_in_1 = fp32_3;

    top->io_Xi_3_in_0 = fp32_0;
    top->io_Yi_3_in_0 = fp32_1;
    top->io_Xi_3_in_1 = fp32_2;
    top->io_Yi_3_in_1 = fp32_3;
    
    top->io_Xi_4_in_0 = fp32_0;
    top->io_Yi_4_in_0 = fp32_1;
    top->io_Xi_4_in_1 = fp32_2;
    top->io_Yi_4_in_1 = fp32_3;

    top->io_Xi_5_in_0 = fp32_0;
    top->io_Yi_5_in_0 = fp32_1;
    top->io_Xi_5_in_1 = fp32_2;
    top->io_Yi_5_in_1 = fp32_3;

    top->io_Xi_6_in_0 = fp32_0;
    top->io_Yi_6_in_0 = fp32_1;
    top->io_Xi_6_in_1 = fp32_2;
    top->io_Yi_6_in_1 = fp32_3;

    top->io_Xi_7_in_0 = fp32_0;
    top->io_Yi_7_in_0 = fp32_1;
    top->io_Xi_7_in_1 = fp32_2;
    top->io_Yi_7_in_1 = fp32_3;

    Verilated::gotFinish(false);

    VL_PRINTF("Run test for FP32 ...\n");

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

        main_time++;

        if (main_time == 802) 
        {
            cout << "out_2 : " << std::bitset<32>( top->io_out ).to_string() << endl;
            VL_PRINTF("Test done\n");
            Verilated::gotFinish(true);
        }
    }

    Verilated::flushCall();
    top->final();
    delete top;
    top = NULL;
    exit(0);
}