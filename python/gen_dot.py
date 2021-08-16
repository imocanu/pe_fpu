from common import *
from PE_FPU import *

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)

def check_number_INPUTS():
    if (int(totalNR) > 2):
        print("->", totalNR)
    else:
        print("="*50)
        print("PLEASE GENERATE AT lEAST 2 INPUTS - current is ", totalNR)
        print("="*50)
        exit(1) 

def test_5_DOT_FP32():
    # DOT product
    check_number_INPUTS() 
    
    random_in_1_bin = readfile(fpu32_genInput_1)
    random_in_2_bin = readfile(fpu32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)-1):    

        pe_1.Xi = constant_ZERO
        pe_1.Yi = constant_ZERO

        pe_1.Yj = constant_ZERO
        pe_1.Xj = constant_ZERO

        pe_1.a1 = random_in_1_bin[i]
        pe_1.B1 = random_in_2_bin[i]

        pe_1.a2 = constant_ZERO
        pe_1.B2 = constant_ZERO

        pe_1.mux_1.set_Sel(3)
        pe_1.mux_2.set_Sel(2)
        pe_1.mux_3.set_Sel(1)
        pe_1.mux_4.set_Sel(1)
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        pe_1.mux_7.set_Sel(1)
        pe_1.ADDSUB_1.op = False # ADD
        pe_1.ADDSUB_2.op = False # ADD

        pe_1.run_PE()

        pe_1.mux_3.set_Sel(2)
        pe_1.mux_4.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        pe_1.a2 = random_in_1_bin[i+1]
        pe_1.B2 = random_in_1_bin[i+1]

        pe_1.run_PE()
        
    print("~"*50)
    print("> PE OUTPUT for iteration ", i)
    print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
    print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
    print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        
        
    pe_output_bin.append(pe_1.ADDSUB_2_OUT)
    write2file(pe_out_test5_DOT_FP32_result, pe_output_bin)  


def test_5_DOT_INT():
    # DOT product
    check_number_INPUTS() 
    
    random_in_1_bin = readfile(int32_genInput_1)
    random_in_2_bin = readfile(int32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    pe_1.enableINT()
    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)-1):    

        pe_1.Xi = constant_ZERO
        pe_1.Yi = constant_ZERO

        pe_1.Yj = constant_ZERO
        pe_1.Xj = constant_ZERO

        pe_1.a1 = random_in_1_bin[i]
        pe_1.B1 = random_in_2_bin[i]

        pe_1.a2 = constant_ZERO
        pe_1.B2 = constant_ZERO

        pe_1.mux_1.set_Sel(3)
        pe_1.mux_2.set_Sel(2)
        pe_1.mux_3.set_Sel(1)
        pe_1.mux_4.set_Sel(1)
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        pe_1.mux_7.set_Sel(1)
        pe_1.ADDSUB_1.op = False # ADD
        pe_1.ADDSUB_2.op = False # ADD

        pe_1.run_PE()

        pe_1.mux_3.set_Sel(2)
        pe_1.mux_4.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        pe_1.a2 = random_in_1_bin[i+1]
        pe_1.B2 = random_in_1_bin[i+1]

        pe_1.run_PE()
        
    print("~"*50)
    print("> PE OUTPUT for iteration ", i)
    print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
    print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
    print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        
        
    pe_output_bin.append(pe_1.ADDSUB_2_OUT)
    write2file(pe_out_test5_DOT_INT_result, pe_output_bin)  


print("@"*50)
test_5_DOT_FP32()
print("@"*50)
test_5_DOT_INT()