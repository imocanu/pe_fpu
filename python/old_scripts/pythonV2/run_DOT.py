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

for pe in all_pe:
    pe.enableINT()
    # ~~~~~~~~~~~~~~~~~~~~~
    pe.Xi = "00000000000000000000000000000011"   #  3
    pe.Yi = "00000000000000000000000000000001"   #  1
    pe.a1 = constant_ZERO
    pe.B1 = constant_ZERO
    # ~~~~~~~~~~~~~~~~~~~~~
    pe.Xj = "00000000000000000000000000000001"   #  1
    pe.Yj = "00000000000000000000000000000001"   #  1
    pe.a2 = constant_ZERO
    pe.B2 = constant_ZERO
    # ~~~~~~~~~~~~~~~~~~~~~

states = [DOT.INIT, DOT.SUM, DOT.MUL, DOT.STOP]
fsm.setStates(states)
fsm.setAllPE(all_pe)
fsm.runTYPE_DOT()   # DOT PRODUCT
fsm.runSUM_2_in_2_out()
print("-"*50)