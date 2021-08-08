from common import *
from PE_FPU import *

def test_3():
    random_float_1_in_bin = readfile(fpu32_genInput_1)
    random_float_2_in_bin = readfile(fpu32_genInput_2)

    pe_output_test3_bin = []

    # PE_FPU
    pe_1 = PE_FPU()
    print(len(random_float_1_in_bin))

    for i in range(len(random_float_1_in_bin)):    
        pe_1.a1 = random_float_1_in_bin[i]
        pe_1.B1 = pe_1.Xi = random_float_2_in_bin[i]
        pe_1.refresh()

        pe_1.mux_1.set_Sel(3) # a1
        pe_1.mux_1.set_INPUTS(pe_1.ADDSUB_1_OUT, pe_1.Yi, pe_1.a1)
        pe_1.mux_2.set_Sel(2) # B1
        pe_1.mux_2.set_INPUTS(pe_1.Xi, pe_1.B1, pe_1.ADDSUB_1_OUT)
        pe_1.refresh()

        pe_1.MULT_1.set_INPUTS(pe_1.mux_1_out, pe_1.mux_2_out)
        pe_1.MULT_2.set_INPUTS(pe_1.mux_3_out, pe_1.mux_4_out)
        pe_1.refresh()

        pe_1.mux_5.set_Sel(2)
        pe_1.mux_5.set_INPUTS(pe_1.Yi, pe_1.MULT_1_out, "empty")
        pe_1.mux_6.set_Sel(1)
        pe_1.mux_6.set_INPUTS(pe_1.Xi, pe_1.MULT_2_out, "empty")
        pe_1.refresh()

        pe_1.ADDSUB_1.set_INPUTS(pe_1.mux_5_out, pe_1.mux_6_out)
        pe_1.refresh()

        pe_1.mux_7.set_Sel(2)
        pe_1.mux_7.set_INPUTS(pe_1.MULT_1_out, pe_1.ADDSUB_1_OUT, "empty") 
        pe_1.refresh()

        pe_1.ADDSUB_2.set_INPUTS(pe_1.mux_7_out, pe_1.Xi)
        pe_1.refresh()

        print("PE OUTPUT :")
        print("  ADDSUB_1_OUT :", pe_1.ADDSUB_1_OUT)
        print("  ADDSUB_2_OUT :", pe_1.ADDSUB_2_OUT)
        pe_1.sim_Mem_OUT = pe_1.ADDSUB_1_OUT + pe_1.ADDSUB_2_OUT
        print("  sim_Mem_OUT  :", pe_1.sim_Mem_OUT)
        pe_output_test3_bin.append(pe_1.ADDSUB_1_OUT)


    write2file(pe_output_test3_result, pe_output_test3_bin)

def test_4():
    # Euclidian distance :  d(p,q)= sqrt ( (q1-p1)^{2}) + ((q2-p2)^2) )
    pass


print("~"*50)
test_3()