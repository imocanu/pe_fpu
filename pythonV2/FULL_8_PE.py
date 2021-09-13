from common import *
from PE_FPU import *
from enum import IntEnum

class L2(IntEnum):
    INIT = 0
    SUM  = 1
    MUL  = 2
    STOP = 3

class DOT(IntEnum):
    INIT = 0
    SUM  = 1
    MUL  = 2
    STOP = 3
    
class sum(IntEnum):
    INIT  = 0
    START = 1
    STOP  = 2

# class pe(IntEnum):
#     STATE = 0
#     START = 0
#     STOP  = 1

class FSM_PE():
    def __init__(self, optype=0):
         self.states = []
         self.sum = [sum.INIT, sum.START, sum.STOP]
         self.all_pe = []
         self.state = None
         self.optype = optype
    
    def setStates(self, states):
        self.states = states
    
    def setAllPE(self, all_pe):
        self.all_pe = all_pe

    def runSUM_2_in_2_out(self):
        print("~"*50)
        print("[*]  >>>> runSUM_2_in_2_out - ONLY ONE OUTPUT from PE !!!")
        print("~"*50)
        self.state = self.sum[0]
        while True:
            if(self.state == sum.INIT):
                print("SUM INIT")
                self.state = sum.START

                for pe_1 in self.all_pe:
                    pe_1.mux_5.set_Sel(0)
                    pe_1.mux_6.set_Sel(0)
                    pe_1.mux_7.set_Sel(0)
                    pe_1.mux_8.set_Sel(0)
                    pe_1.mux_9.set_Sel(0)
                    pe_1.mux_10.set_Sel(0)

                # PE - Master - runSUM_V3
                self.all_pe[0].tosum_1 = self.all_pe[0].mux_9_out
                self.all_pe[0].tosum_2 = self.all_pe[1].mux_9_out

                # PE - Slaves - runSUM_V3
                self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                self.all_pe[1].tosum_2 = self.all_pe[3].mux_9_out

                self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                self.all_pe[2].tosum_2 = self.all_pe[5].mux_9_out

                self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                self.all_pe[3].tosum_2 = self.all_pe[7].mux_9_out

                print("~"*50)
                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [NO Clock - dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                print("~"*50)

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)

            elif(self.state == sum.START):
                print("SUM START")
                self.state = sum.STOP
                clockNO = 0
                for i in range(2):
                    clockNO = clockNO + 1
                    print("  -> clock no :", clockNO, "<-         MUX_9_OUT                          MUX_10_OUT ")
                    # PE - Master - runSUM_V3
                    self.all_pe[0].tosum_1 = self.all_pe[0].mux_9_out
                    self.all_pe[0].tosum_2 = self.all_pe[1].mux_9_out

                    # PE - Slaves - runSUM_V3
                    self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                    self.all_pe[1].tosum_2 = self.all_pe[3].mux_9_out

                    self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                    self.all_pe[2].tosum_2 = self.all_pe[5].mux_9_out

                    self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                    self.all_pe[3].tosum_2 = self.all_pe[7].mux_9_out

                    for pe_1 in self.all_pe:
                        pe_1.clock_PE()

                    counter = -1
                    for pe_1 in self.all_pe:
                        counter = counter +1
                        print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                    print("~"*50)

            elif(self.state == sum.STOP):
                print("SUM STOP")
                self.state = sum.STOP
                break

    def init_rest_of_pe(self):
        nr_in_row = 8
        pc = 4
        total_pe = len(self.all_pe)
        master_id = 0
        for i in range (total_pe):

            if(nr_in_row >= total_pe):
                break    # break here

            for y in range(pc, nr_in_row):
                if(master_id+master_id+1 >= total_pe):
                    print("!!!!!!!!**2**!!!!!!!!")
                    break    # break here
                
                master_id = y
                print("<M>", master_id, "   <s>", master_id+master_id, " <s>" , master_id+master_id+1)
                self.all_pe[master_id].tosum_1 = self.all_pe[master_id+master_id].mux_9_out
                self.all_pe[master_id].tosum_2 = self.all_pe[master_id+master_id].mux_10_out
                self.all_pe[master_id].tosum_3 = self.all_pe[master_id+master_id+1].mux_9_out
                self.all_pe[master_id].tosum_4 = self.all_pe[master_id+master_id+1].mux_10_out
            
            print(">>>>>>>>>>>")
            pc = nr_in_row
            nr_in_row = nr_in_row * 2


    def runSUM_4_in_2_out_TEST(self):
        print("~"*50)


    def runSUM_4_in_2_out_Scalability(self, range_loop=3):
        print("~"*50)
        print("[*]  >>>> TEST Scalability : runSUM_4_in_2_out !!!")
        print("~"*50)

        if(len(self.all_pe) <= 16):
            print("[!]")
            print("[!] Please choose more than 16 inputs for test !!!!! ")
            print("[!]")
            exit(1)

        self.state = self.sum[0]
        while True:
            if(self.state == sum.INIT):
                print("SUM INIT")
                self.state = sum.START

                for pe_1 in self.all_pe:
                    pe_1.mux_5.set_Sel(0)
                    pe_1.mux_6.set_Sel(0)
                    pe_1.mux_7.set_Sel(0)
                    pe_1.mux_8.set_Sel(0)
                    pe_1.mux_9.set_Sel(0)
                    pe_1.mux_10.set_Sel(0)

                # PE - Master - runSUM_4_in_2_out
                self.all_pe[0].tosum_1 = self.all_pe[1].mux_9_out
                self.all_pe[0].tosum_2 = self.all_pe[1].mux_10_out
                self.all_pe[0].tosum_3 = self.all_pe[0].mux_9_out
                self.all_pe[0].tosum_4 = self.all_pe[0].mux_10_out

                # PE - Slaves - runSUM_4_in_2_out
                self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                self.init_rest_of_pe()

                print("~"*50)
                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [NO Clock - dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                print("~"*50)

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)

            elif(self.state == sum.START):
                print("SUM START")
                self.state = sum.STOP

                clockNO = 0
                for i in range(range_loop):
                    clockNO = clockNO + 1
                    print("  -> clock no :", clockNO, "<-         MUX_9_OUT                          MUX_10_OUT ")

                    # PE - Master - runSUM_4_in_2_out
                    self.all_pe[0].tosum_1 = self.all_pe[1].mux_9_out
                    self.all_pe[0].tosum_2 = self.all_pe[1].mux_10_out
                    self.all_pe[0].tosum_3 = self.all_pe[0].mux_9_out
                    self.all_pe[0].tosum_4 = self.all_pe[0].mux_10_out

                     # PE - Slaves - runSUM_4_in_2_out
                    self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                    self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                    self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                    self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                    self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                    self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                    self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                    self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                    self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                    self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                    self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                    self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                    self.init_rest_of_pe()

                    for pe_1 in self.all_pe:
                        pe_1.clock_PE()

                    counter = -1
                    for pe_1 in self.all_pe:
                        counter = counter +1
                        print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                    print("~"*50)

            elif(self.state == sum.STOP):
                print("SUM STOP")
                self.state = sum.STOP
                break




    def runSUM_4_in_2_out(self):
        print("~"*50)
        print("[*]  >>>> runSUM_4_in_2_out !!!")
        print("~"*50)
        self.state = self.sum[0]
        while True:
            if(self.state == sum.INIT):
                print("SUM INIT")
                self.state = sum.START

                for pe_1 in self.all_pe:
                    pe_1.mux_5.set_Sel(0)
                    pe_1.mux_6.set_Sel(0)
                    pe_1.mux_7.set_Sel(0)
                    pe_1.mux_8.set_Sel(0)
                    pe_1.mux_9.set_Sel(0)
                    pe_1.mux_10.set_Sel(0)

                # PE - Master - runSUM_4_in_2_out
                self.all_pe[0].tosum_1 = self.all_pe[1].mux_9_out
                self.all_pe[0].tosum_2 = self.all_pe[1].mux_10_out
                self.all_pe[0].tosum_3 = self.all_pe[0].mux_9_out
                self.all_pe[0].tosum_4 = self.all_pe[0].mux_10_out

                # PE - Slaves - runSUM_4_in_2_out
                self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                print("~"*50)
                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [NO Clock - dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                print("~"*50)

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)

            elif(self.state == sum.START):
                print("SUM START")
                self.state = sum.STOP

                clockNO = 0
                for i in range(3):
                    clockNO = clockNO + 1
                    print("  -> clock no :", clockNO, "<-         MUX_9_OUT                          MUX_10_OUT ")

                    # PE - Master - runSUM_4_in_2_out
                    self.all_pe[0].tosum_1 = self.all_pe[1].mux_9_out
                    self.all_pe[0].tosum_2 = self.all_pe[1].mux_10_out
                    self.all_pe[0].tosum_3 = self.all_pe[0].mux_9_out
                    self.all_pe[0].tosum_4 = self.all_pe[0].mux_10_out

                     # PE - Slaves - runSUM_4_in_2_out
                    self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                    self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                    self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                    self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                    self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                    self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                    self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                    self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                    self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                    self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                    self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                    self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                    for pe_1 in self.all_pe:
                        pe_1.clock_PE()

                    counter = -1
                    for pe_1 in self.all_pe:
                        counter = counter +1
                        print("  [dbg PE",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                    print("~"*50)

            elif(self.state == sum.STOP):
                print("SUM STOP")
                self.state = sum.STOP
                break

    def runSUM_V1(self):
        self.state = self.sum[0]
        while True:
            if(self.state == sum.INIT):
                print("SUM INIT")
                self.state = sum.START

                for pe_1 in self.all_pe:
                    pe_1.mux_5.set_Sel(0)
                    pe_1.mux_6.set_Sel(0)
                    pe_1.mux_7.set_Sel(0)
                    pe_1.mux_8.set_Sel(0)
                    pe_1.mux_9.set_Sel(0)
                    pe_1.mux_10.set_Sel(0)

                # PE - Master
                self.all_pe[0].tosum_1 = self.all_pe[0].mux_9_out
                self.all_pe[0].tosum_2 = self.all_pe[1].mux_9_out
                self.all_pe[0].tosum_3 = self.all_pe[0].mux_10_out
                self.all_pe[0].tosum_4 = self.all_pe[1].mux_10_out

                # PE - Slaves
                self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                print("~"*50)
                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [NO Clock - dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                print("~"*50)

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

                counter = -1
                for pe_1 in self.all_pe:
                    counter = counter +1
                    print("  [dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)

            elif(self.state == sum.START):
                print("SUM START")
                self.state = sum.STOP

                for i in range(2):

                    # PE - Master
                    self.all_pe[0].tosum_1 = self.all_pe[0].mux_9_out
                    self.all_pe[0].tosum_2 = self.all_pe[1].mux_9_out
                    self.all_pe[0].tosum_3 = self.all_pe[0].mux_10_out
                    self.all_pe[0].tosum_4 = self.all_pe[1].mux_10_out


                     # PE - Slaves
                    self.all_pe[1].tosum_1 = self.all_pe[2].mux_9_out
                    self.all_pe[1].tosum_2 = self.all_pe[2].mux_10_out
                    self.all_pe[1].tosum_3 = self.all_pe[3].mux_9_out
                    self.all_pe[1].tosum_4 = self.all_pe[3].mux_10_out

                    self.all_pe[2].tosum_1 = self.all_pe[4].mux_9_out
                    self.all_pe[2].tosum_2 = self.all_pe[4].mux_10_out
                    self.all_pe[2].tosum_3 = self.all_pe[5].mux_9_out
                    self.all_pe[2].tosum_4 = self.all_pe[5].mux_10_out

                    self.all_pe[3].tosum_1 = self.all_pe[6].mux_9_out
                    self.all_pe[3].tosum_2 = self.all_pe[6].mux_10_out
                    self.all_pe[3].tosum_3 = self.all_pe[7].mux_9_out
                    self.all_pe[3].tosum_4 = self.all_pe[7].mux_10_out

                    for pe_1 in self.all_pe:
                        pe_1.clock_PE()

                    counter = -1
                    for pe_1 in self.all_pe:
                        counter = counter +1
                        print("  [dbg",counter,"] : ", pe_1.mux_9_out, " ", pe_1.mux_10_out)
                    print("~"*50)

            elif(self.state == sum.STOP):
                print("SUM STOP")
                self.state = sum.STOP
                break

    
    def runTYPE_L2(self):
        self.state = self.states[0]
        while True:
            if(self.state == L2.INIT):
                print("L2 INIT")
                self.state = L2.SUM
                for pe_1 in self.all_pe:

                    pe_1.mux_1.set_Sel(1) 
                    pe_1.mux_2.set_Sel(1) 
                    pe_1.mux_3.set_Sel(1)
                    pe_1.mux_4.set_Sel(1)

                    pe_1.mux_5.set_Sel(1)
                    pe_1.mux_6.set_Sel(1)

                    pe_1.mux_7.set_Sel(1)
                    pe_1.mux_8.set_Sel(1)
                    
                    pe_1.mux_9.set_Sel(1)
                    pe_1.mux_10.set_Sel(1)

                    pe_1.ADDSUB_1.op = False
                    pe_1.ADDSUB_2.op = False
                          
            elif(self.state == L2.SUM):
                print("L2 SUM")
                self.state = L2.MUL

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

            elif(self.state == L2.MUL):
                print("L2 MUL")
                self.state = L2.STOP

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

            elif(self.state == L2.STOP):
                print("L2 STOP")
                self.state = L2.STOP
                pe_number = 0
                for pe_1 in self.all_pe:
                    pe_number = pe_number + 1
                    print("> PE OUTPUT ", pe_number)
                    print("   MUX_9_OUT  :", pe_1.mux_9_out)
                    print("   MUX_10_OUT :", pe_1.mux_10_out)

                break

    
    def runTYPE_DOT(self):
        self.state = self.states[0]
        while True:
            if(self.state == DOT.INIT):
                print("DOT INIT")
                self.state = DOT.SUM
                for pe_1 in self.all_pe:

                    pe_1.mux_1.set_Sel(0) 
                    pe_1.mux_2.set_Sel(0) 
                    pe_1.mux_3.set_Sel(0)
                    pe_1.mux_4.set_Sel(0)

                    pe_1.mux_5.set_Sel(2)
                    pe_1.mux_6.set_Sel(2)

                    pe_1.mux_7.set_Sel(0)
                    pe_1.mux_8.set_Sel(0)
                    
                    pe_1.mux_9.set_Sel(0)
                    pe_1.mux_10.set_Sel(0)

                    pe_1.ADDSUB_1.op = False
                    pe_1.ADDSUB_2.op = False
                          
            elif(self.state == DOT.SUM):
                print("DOT SUM")
                self.state = DOT.MUL

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

            elif(self.state == DOT.MUL):
                print("DOT MUL")
                self.state = DOT.STOP

                for pe_1 in self.all_pe:
                    pe_1.clock_PE()

            elif(self.state == DOT.STOP):
                print("DOT STOP")
                self.state = DOT.STOP
                pe_number = 0
                for pe_1 in self.all_pe:
                    pe_number = pe_number + 1
                    print("> PE OUTPUT ", pe_number)
                    print("   MUX_9_OUT  :", pe_1.mux_9_out)
                    print("   MUX_10_OUT :", pe_1.mux_10_out)

                break
