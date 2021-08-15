from common import *
from PE_FPU import *

def test_0_FP32():
    random_float_1_in_bin = readfile(fpu32_genInput_1)
    random_float_2_in_bin = readfile(fpu32_genInput_2)
    random_float_3_in_bin = readfile(fpu32_genInput_3)
    random_float_4_in_bin = readfile(fpu32_genInput_4)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Total number of inputs : ", len(random_float_1_in_bin))

    for i in range(len(random_float_1_in_bin)):    
        pe_1.a1 = random_float_1_in_bin[i]
        pe_1.B1 = random_float_2_in_bin[i]
        pe_1.Xi = random_float_3_in_bin[i]
        pe_1.Yi = random_float_4_in_bin[i]

        pe_1.Yj = constant_ZERO
        pe_1.a2 = constant_ZERO
        pe_1.Xj = constant_ZERO
        pe_1.B2 = constant_ZERO

        pe_1.mux_1.set_Sel(3) 
        pe_1.mux_2.set_Sel(2) 
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_7.set_Sel(2)

        pe_1.ADDSUB_1.op = False
        pe_1.ADDSUB_2.op = False
        pe_1.run_PE()

        pe_1.mux_6.set_Sel(2) 
        pe_1.mux_7.set_Sel(1) 

        pe_1.run_PE()

        pe_output_bin.append(pe_1.ADDSUB_2_OUT)



    print("~"*50)
    print("> PE OUTPUT for iteration ", i)
    print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
    print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
    print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
    write2file(pe_out_test0_FP32_result, pe_output_bin)


def test_0_INT():
    random_in_1_bin = readfile(int32_genInput_1)
    random_in_2_bin = readfile(int32_genInput_2)
    random_in_3_bin = readfile(int32_genInput_3)
    random_in_4_bin = readfile(int32_genInput_4)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    pe_1.enableINT()

    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)):    
        pe_1.a1 = random_in_1_bin[i]
        pe_1.B1 = random_in_2_bin[i]
        pe_1.Xi = random_in_3_bin[i]
        pe_1.Yi = random_in_4_bin[i]

        pe_1.Yj = constant_ZERO
        pe_1.a2 = constant_ZERO
        pe_1.Xj = constant_ZERO
        pe_1.B2 = constant_ZERO

        pe_1.mux_1.set_Sel(3) 
        pe_1.mux_2.set_Sel(2) 
        pe_1.mux_5.set_Sel(2)
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_7.set_Sel(2)

        pe_1.ADDSUB_1.op = False
        pe_1.ADDSUB_2.op = False
        pe_1.run_PE()

        pe_1.mux_6.set_Sel(2) 
        pe_1.mux_7.set_Sel(1) 

        pe_1.run_PE()

        pe_output_bin.append(pe_1.ADDSUB_2_OUT)



    print("~"*50)
    print("> PE OUTPUT after", i, "iterations")
    print("> Input type :", "INT" if (pe_1.allINT) else "FP32")
    print("    ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
    print("    ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
    print("    sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
    write2file(pe_out_test0_INT_result, pe_output_bin)


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
    pass


def test_4_FP32_POW():
    pass





def test_5_DOT_FP32():
    # DOT product 
    
    random_in_1_bin = readfile(fpu32_genInput_1)
    random_in_2_bin = readfile(fpu32_genInput_2)
    random_in_3_bin = readfile(fpu32_genInput_3)
    random_in_4_bin = readfile(fpu32_genInput_4)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)-1):    

        pe_1.Xi = "00000000000000000000000000000000"
        pe_1.Yi = "00000000000000000000000000000000"

        pe_1.Yj = "00000000000000000000000000000000"
        pe_1.Xj = "00000000000000000000000000000000"

        pe_1.a1 = random_in_2_bin[i]
        pe_1.B1 = random_in_1_bin[i]

        #pe_1.a2 = "00000000000000000000000000000000"
        #pe_1.B2 = "00000000000000000000000000000000"
        pe_1.a2 = random_in_2_bin[i+1]
        pe_1.B2 = random_in_1_bin[i+1]

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
        pe_1.run_PE()
        
        pe_1.mux_3.set_Sel(2)
        pe_1.mux_4.set_Sel(2)

        pe_1.run_PE()
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
    
    random_in_1_bin = readfile(int32_genInput_1)
    random_in_2_bin = readfile(int32_genInput_2)

    pe_output_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    pe_1.enableINT()
    print("Total number of inputs : ", len(random_in_1_bin))

    for i in range(len(random_in_1_bin)-1):    

        pe_1.Xi = "00000000000000000000000000000000"
        pe_1.Yi = "00000000000000000000000000000000"

        pe_1.Yj = "00000000000000000000000000000000"
        pe_1.Xj = "00000000000000000000000000000000"

        pe_1.a1 = random_in_2_bin[i]
        pe_1.B1 = random_in_1_bin[i]

        #pe_1.a2 = "00000000000000000000000000000000"
        #pe_1.B2 = "00000000000000000000000000000000"
        pe_1.a2 = random_in_2_bin[i+1]
        pe_1.B2 = random_in_1_bin[i+1]

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
        pe_1.run_PE()
        
        pe_1.mux_3.set_Sel(2)
        pe_1.mux_4.set_Sel(2)

        pe_1.run_PE()
        pe_1.run_PE()


        print("~"*50)
        print("> PE OUTPUT for iteration ", i)
        print("   ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
        print("   ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
        print("   sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        pe_output_bin.append(pe_1.ADDSUB_2_OUT)


    write2file(pe_out_test5_DOT_FP32_result, pe_output_bin) 

def test_6_MANHATTAN_FP32():
    # MANHATTAN Distance
    pass

def test_7_OTHER_PROD_FP32():
    # OTHER Product
    pass

def test_8_VEC_AGG_FP32():
    # Vector Aggregation
    pass

#print("@"*50)
#test_0_FP32()
print("@"*50)
test_0_INT()
#print("@"*50)
#test_3_FP32()
#print("@"*50)
#test_3_INT()
#print("@"*50)
#test_4_FP32()
#print("@"*50)
#test_5_DOT_FP32()
#print("@"*50)
#test_5_DOT_INT()