from common import *
from PE_FPU import *

def test_6_FP32():
    # Manhattan distance :  (x1 - x2) + (y1 - y2)
    
    random_in_1_bin = readfile(fpu32_genInput_1)
    random_in_2_bin = readfile(fpu32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)):    

        pe_1.Xi = random_in_2_bin[i]
        pe_1.Yi = random_in_1_bin[i]

        pe_1.a1 = "00000000000000000000000000000000"
        pe_1.B1 = "00000000000000000000000000000000"
        pe_1.Yj = "00000000000000000000000000000000"
        pe_1.a2 = "00000000000000000000000000000000"
        pe_1.Xj = "00000000000000000000000000000000"
        pe_1.B2 = "00000000000000000000000000000000"


        pe_1.mux_1.set_Sel(2) # Yi
        pe_1.mux_2.set_Sel(1) # B1
        pe_1.mux_3.set_Sel(1)
        pe_1.mux_4.set_Sel(1)
        pe_1.mux_5.set_Sel(1)
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_7.set_Sel(1)
        pe_1.ADDSUB_1.op = False # SUB
        pe_1.ADDSUB_2.op = True # SUB
        pe_1.run_PE()


        pe_1.mux_1.set_Sel(1) # Yi
        pe_1.mux_2.set_Sel(3) # B1
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        # # Store output for : Xi-Yi * Xi-Yi
        pe_1.sim_Mem_OUT = pe_1.ADDSUB_1_OUT
        pe_1.run_PE()


        pe_1.Xi = random_in_1_bin[i]
        pe_1.Yi = random_in_2_bin[i]

        pe_1.mux_1.set_Sel(2) # Yi
        pe_1.mux_2.set_Sel(1) # B1
        pe_1.mux_3.set_Sel(1)
        pe_1.mux_4.set_Sel(1)
        pe_1.mux_5.set_Sel(1)
        pe_1.mux_6.set_Sel(2)
        pe_1.mux_7.set_Sel(1)
        pe_1.ADDSUB_1.op = True # SUB
        pe_1.ADDSUB_2.op = True # SUB
        pe_1.run_PE()


        pe_1.ADDSUB_2.op = False # SUB
        pe_1.mux_1.set_Sel(1) # Yi
        pe_1.mux_2.set_Sel(3) # B1
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(2)
        # # Store output for : Xi-Yi * Xi-Yi
        
        pe_1.run_PE()


        print("#"*50)
        print("PE OUTPUT :", i)
        print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
        print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
        print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        pe_output_bin.append(pe_1.ADDSUB_2_OUT)


    write2file(pe_out_test6_MAN_FP32_result, pe_output_bin)  


def test_6_manhattan_INT():
    pass

print("@"*50)
test_6_FP32()
# print("@"*50)
# test_6_manhattan_INT()