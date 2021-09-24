from common import *
from PE_FPU import *
from FULL_8_PE import *
from enum import IntEnum


fsm = FSM_PE()

pe_1 = PE_FPU()
pe_2 = PE_FPU()
pe_3 = PE_FPU()
pe_4 = PE_FPU()
pe_5 = PE_FPU()
pe_6 = PE_FPU()
pe_7 = PE_FPU()
pe_8 = PE_FPU()

all_pe = [pe_1, pe_2, pe_3, pe_4, pe_5, pe_6, pe_7, pe_8]

pe_gen_L2_INT = []


states = [L2.INIT, L2.SUM, L2.MUL, L2.STOP]
fsm.setStates(states)
fsm.setAllPE(all_pe)


random_in_1_bin = readfile(fpu32_genInput_1)
random_in_2_bin = readfile(fpu32_genInput_2)

pe_output_bin = []

print("Total number of inputs : ", len(random_in_1_bin))

for i in range(len(random_in_1_bin)):
    for pe in all_pe:
        pe.disableINT()
        # ~~~~~~~~~~~~~~~~~~~~~
        pe.Xi = random_in_1_bin[i]   
        pe.Yi = random_in_2_bin[i]   
        pe.a1 = constant_ZERO
        pe.B1 = constant_ZERO
        # ~~~~~~~~~~~~~~~~~~~~~
        pe.Xj = random_in_1_bin[i]
        pe.Yj = random_in_2_bin[i]
        pe.a2 = constant_ZERO
        pe.B2 = constant_ZERO
        # ~~~~~~~~~~~~~~~~~~~~~

        fsm.runTYPE_L2() # L2 type
        fsm.runSUM_4_in_2_out()
        #fsm.runSUM_V1()

        print("-"*50)
        print("   FINAL OUT_1 :", pe_1.mux_9_out)
        print("   FINAL OUT_2 :", pe_1.mux_10_out)
        pe_1.get_FINAL_ADD()
        pe_gen_L2_INT.append(pe_1.get_FINAL_ADD_binary())
        write2file(pe_out_L2_FP32_result, pe_gen_L2_INT)
        print("-"*50)



















# for pe in all_pe:
#     pe.enableINT()
#     # ~~~~~~~~~~~~~~~~~~~~~
#     pe.Xi = "00000000000000000000000000000011"   #  3
#     pe.Yi = "00000000000000000000000000000001"   #  1
#     pe.a1 = constant_ZERO
#     pe.B1 = constant_ZERO
#     # ~~~~~~~~~~~~~~~~~~~~~
#     pe.Xj = "00000000000000000000000000000001"   #  1
#     pe.Yj = "00000000000000000000000000000001"   #  1
#     pe.a2 = constant_ZERO
#     pe.B2 = constant_ZERO
#     # ~~~~~~~~~~~~~~~~~~~~~

# states = [L2.INIT, L2.SUM, L2.MUL, L2.STOP]
# fsm.setStates(states)
# fsm.setAllPE(all_pe)
# fsm.runTYPE_L2() # L2 type
# #fsm.runSUM_4_in_2_out()
# fsm.runSUM_V1()

# print("   FINAL OUT_1 :", pe_1.mux_9_out)
# print("   FINAL OUT_2 :", pe_1.mux_10_out)
# print("   SUM         :", pe_1.get_FINAL_ADD())
# pe_gen_L2_INT.append(pe_1.get_FINAL_ADD())

# print("-"*50)