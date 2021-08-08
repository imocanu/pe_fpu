from common import *
from PE_FPU import *

def test_3_FP32():
    random_float_1_in_bin = readfile(fpu32_genInput_1)
    random_float_2_in_bin = readfile(fpu32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Total number of inputs : ", len(random_float_1_in_bin))

    for i in range(len(random_float_1_in_bin)):    
        pe_1.a1 = random_float_1_in_bin[i]
        pe_1.B1 = random_float_2_in_bin[i]
        pe_1.Xi = random_float_2_in_bin[i]

        pe_1.Yi = "00000000000000000000000000000000"
        pe_1.Yj = "00000000000000000000000000000000"
        pe_1.a2 = "00000000000000000000000000000000"
        pe_1.Xj = "00000000000000000000000000000000"
        pe_1.B2 = "00000000000000000000000000000000"

        pe_1.mux_1.set_Sel(3) # a1
        pe_1.mux_2.set_Sel(2) # B1
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_7.set_Sel(2)

        pe_1.ADDSUB_1.op = False
        pe_1.ADDSUB_2.op = False


        pe_1.run_PE()


        print("#"*50)
        print("PE OUTPUT :", i)
        print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
        print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
        pe_1.sim_Mem_OUT = pe_1.ADDSUB_1_OUT + pe_1.ADDSUB_2_OUT
        print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        pe_output_bin.append(pe_1.ADDSUB_1_OUT)


    write2file(pe_out_test3_FP32_result, pe_output_bin)


def test_3_INT():
    random_float_1_in_bin = readfile(int32_genInput_1)
    random_float_2_in_bin = readfile(int32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Input Type : INT")
    print("Total number of inputs : ", len(random_float_1_in_bin))

    for i in range(len(random_float_1_in_bin)):    
        pe_1.a1 = random_float_1_in_bin[i]
        pe_1.B1 = random_float_2_in_bin[i]
        pe_1.Xi = random_float_2_in_bin[i]

        pe_1.Yi = "00000000000000000000000000000000"
        pe_1.Yj = "00000000000000000000000000000000"
        pe_1.a2 = "00000000000000000000000000000000"
        pe_1.Xj = "00000000000000000000000000000000"
        pe_1.B2 = "00000000000000000000000000000000"

        pe_1.mux_1.set_Sel(3) # a1
        pe_1.mux_2.set_Sel(2) # B1
        pe_1.mux_3.set_Sel(1)
        pe_1.mux_4.set_Sel(1)
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_7.set_Sel(2)

        pe_1.ADDSUB_1.op = False
        pe_1.ADDSUB_2.op = False
        pe_1.useINT()


        pe_1.run_PE()


        print("-"*50)
        print("PE OUTPUT :", i)
        print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
        print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
        pe_1.sim_Mem_OUT = pe_1.ADDSUB_1_OUT + pe_1.ADDSUB_2_OUT
        print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        print("*"*50)
        pe_output_bin.append(pe_1.ADDSUB_1_OUT)


    write2file(pe_out_test3_INT_result, pe_output_bin)



def test_4():
    # Euclidian distance :  d(p,q)= sqrt ( (q1-p1)^{2}) + ((q2-p2)^2) )
    # (q1-p1)^{2}) + ((q2-p2)^2) 
    # P - p1 p2
    # Q - q1 q2
    # q1-p1 * q1-p1 => Yi Xi  
    
    # # 1. q1-p1 => Yi Xi 
    # mux1 sel 1 mux2 sel 0
    # mux5 sel 0 mux6 sel 0
    # SUB_1
    # # 2. q1-p1 * q1-p1
    # mux1 sel 0 mux2 sel 0
    # MUL_1
    # Xi = 0000000000000
    # SUB_1
    # SUB_1_out -> save
    # # 3. q1-p1 => Yi Xi 
    # mux1 sel 1 mux2 sel 0
    # mux5 sel 0 mux6 sel 0
    # SUB_1
    # save to MEM
    # # 4. q1-p1 * q1-p1
    # mux1 sel 0 mux2 sel 0
    # MUL_1
    # Xi = 0000000000000
    # SUB_1
    # # 5. final add 
    # mux7 sel 1
    # ADD_2
    # # 6. Result = ADD_2_out  
    

    pass

def test_5():
    # DOT product 
    pass

print("@"*50)
test_3_FP32()
print("@"*50)
test_3_INT()