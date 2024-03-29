from common import *

class MUX:
    def __init__(self):
        self.id = 0
        self.in1  = ""
        self.in2  = ""
        self.in3  = ""
        self.sel = 0
        self.out = 0

    def set_Sel(self, val):
        self.sel = val

    def set_INPUTS(self, in1, in2, in3):
        self.in1  = in1
        self.in2  = in2
        self.in3  = in3
        self.calc()
    
    def calc(self):
        if(self.sel == 1):
            self.out = self.in1
        elif(self.sel == 2):
            self.out = self.in2
        elif(self.sel == 3):
            self.out = self.in3
        else:
            self.sel = 1
            self.out = self.in1
        
        if DEBUG:
            print("[ mux", self.id, "]", self.in1, ":", self.in2, ":", self.in3)
            print("         [sel]: ", self.sel , "-> out :", self.out)

    def get_OUT(self):
        return self.out


class MULT:
    def __init__(self):
        self.id = 0
        self.in1  = 0
        self.in2  = 0
        self.ba1 = 0
        self.ba2 = 0
        self.round = 0
        self.useINT = False
        self.out = 0
    
    def set_INPUTS(self, in1, in2):
        self.in1 = in1
        self.in2 = in2
        self.ba1 = BitArray(bin=self.in1).int
        self.ba2 = BitArray(bin=self.in2).int
        self.calc()

    def calc(self):
        if(self.useINT):
            # rez32 = np.multiply(self.in1 , self.in2, dtype=np.int32)
            # testBIN = core.single(np.binary_repr(rez32, width=32))
            # ssw = str(testBIN)
            # ssw = ssw.replace(" ", "") 
            # self.out = ssw
            rez32 = np.multiply(self.ba1 , self.ba2, dtype=np.int32)
            testBIN = core.single(np.binary_repr(rez32, width=32))
            self.out = str(testBIN)
            self.out = self.out.replace(" ", "") 
        else:
            rez32 = core.single(self.in1) * core.single(self.in2)
            self.out = str(rez32)
            self.out = self.out.replace(" ", "")

        if DEBUG: 
            print("[MULT", self.id, "]", self.in1, "*", self.in2, "=", self.out)
    
    def get_OUT(self):
        return self.out
    

class ADDSUB:
    def __init__(self):
        self.id = 0
        self.in1  = 0
        self.in2  = 0
        self.ba1 = 0
        self.ba2 = 0
        self.round = 0
        self.op = False
        self.useINT = False
        self.out = 0

    def set_INPUTS(self, in1, in2):
        self.in1  = in1
        self.in2  = in2
        self.ba1 = BitArray(bin=self.in1).int
        self.ba2 = BitArray(bin=self.in2).int
        self.calc()

    def calc(self):
        if(self.op):
            if(self.useINT):
                # rez32 = np.sum([self.in1 , self.in2], dtype=np.int32)
                # testBIN = core.single(np.binary_repr(rez32, width=32))
                # ssw = str(testBIN)
                # ssw = ssw.replace(" ", "")
                # self.out = ssw
                rez32 = np.subtract(self.ba1 , self.ba2, dtype=np.int32)
                testBIN = core.single(np.binary_repr(rez32, width=32))
                self.out = str(testBIN)
                self.out = self.out.replace(" ", "") 

            else: 
                rez32 = core.single(self.in1) - core.single(self.in2)
                self.out = str(rez32)
                self.out = self.out.replace(" ", "")

            if DEBUG:
                print("[ SUB", self.id, "]", self.in1, "-", self.in2, "=", self.out)
        else:
            if(self.useINT):
                    # rez32 = np.subtract(in1 , in2, dtype=np.int32)
                    # testBIN = core.single(np.binary_repr(rez32, width=32))
                    # ssw = str(testBIN)
                    # ssw = ssw.replace(" ", "") 
                    # self.out = ssw
                    rez32 = np.sum([self.ba1 , self.ba2], dtype=np.int32)
                    testBIN = core.single(np.binary_repr(rez32, width=32))
                    self.out = str(testBIN)
                    self.out = self.out.replace(" ", "") 
            else:
                rez32 = core.single(self.in1) + core.single(self.in2)
                self.out = str(rez32)
                self.out = self.out.replace(" ", "")

            if DEBUG:
                print("[ ADD", self.id, "]", self.in1, "+", self.in2, "=", self.out)

    def get_OUT(self):
        return self.out


class PE_FPU:
    def __init__(self, Yi="", a1="", Xi="", B1="", Yj="", a2="", Xj="", B2=""):
        # CLOCK
        self.clock = 0

        # PE FLAG
        self.useINT = False
        
        # INPUTS
        self.Yi = Yi
        self.a1 = a1
        self.Xi = Xi
        self.B1 = B1
        self.Yj = Yj
        self.a2 = a2
        self.Xj = Xj
        self.B2 = B2

        # MODULES
        self.mux_1 = MUX()
        self.mux_1.id = 1
        self.mux_2 = MUX()
        self.mux_2.id = 2
        self.mux_3 = MUX()
        self.mux_3.id = 3
        self.mux_4 = MUX()
        self.mux_4.id = 4
        self.mux_5 = MUX()
        self.mux_5.id = 5
        self.mux_6 = MUX()
        self.mux_6.id = 6
        self.mux_7 = MUX()
        self.mux_7.id = 7
        self.MULT_1 = MULT()
        self.MULT_1.id = 1
        self.MULT_2 = MULT()
        self.MULT_2.id = 2
        self.ADDSUB_1 = ADDSUB()
        self.ADDSUB_1.id = 1
        self.ADDSUB_2 = ADDSUB()
        self.ADDSUB_2.id = 2
        self.sim_Mem_OUT = "00000000000000000000000000000000"

        # FLAGS : INT or FP32
        self.allINT = False
        self.MULT_1.useINT = False
        self.MULT_2.useINT = False  
        self.ADDSUB_1.useINT = False 
        self.ADDSUB_2.useINT = False 

        # OUTPUTS
        self.mux_1_out = self.mux_1.get_OUT()
        self.mux_2_out = self.mux_2.get_OUT()
        self.mux_3_out = self.mux_3.get_OUT()
        self.mux_4_out = self.mux_4.get_OUT()
        self.mux_5_out = self.mux_5.get_OUT()
        self.mux_6_out = self.mux_6.get_OUT()
        self.mux_7_out = self.mux_7.get_OUT()
        self.MULT_1_out = self.MULT_1.get_OUT()
        self.MULT_2_out = self.MULT_2.get_OUT()
        self.ADDSUB_1_OUT = self.ADDSUB_1.get_OUT()
        self.ADDSUB_2_OUT = self.ADDSUB_2.get_OUT()

    def refresh(self):
        self.mux_1_out = self.mux_1.get_OUT()
        self.mux_2_out = self.mux_2.get_OUT()
        self.mux_3_out = self.mux_3.get_OUT()
        self.mux_4_out = self.mux_4.get_OUT()
        self.mux_5_out = self.mux_5.get_OUT()
        self.mux_6_out = self.mux_6.get_OUT()
        self.mux_7_out = self.mux_7.get_OUT()
        self.MULT_1_out = self.MULT_1.get_OUT()
        self.MULT_2_out = self.MULT_2.get_OUT()
        self.ADDSUB_1_OUT = self.ADDSUB_1.get_OUT()
        self.ADDSUB_2_OUT = self.ADDSUB_2.get_OUT()
    
    def run_PE(self):
        self.clock = self.clock + 1
        print("~"*50)
        print("    *****> Start CLOCK [",str(self.clock),"] - PE_FPU <*****")
        print("~"*50)
        self.refresh()
        self.mux_1.set_INPUTS(self.ADDSUB_1_OUT, self.Yi, self.a1)
        self.refresh()
        self.mux_2.set_INPUTS(self.Xi, self.B1, self.ADDSUB_1_OUT)
        self.refresh()

        self.mux_3.set_INPUTS(self.Yj, self.a2, "[DontCare]")
        self.refresh()
        self.mux_4.set_INPUTS(self.Xj, self.B2, "[DontCare]")
        self.refresh()

        self.MULT_1.set_INPUTS(self.mux_1_out, self.mux_2_out)
        self.refresh()
        self.MULT_2.set_INPUTS(self.mux_3_out, self.mux_4_out)
        self.refresh()

        self.mux_5.set_INPUTS(self.Yi, self.MULT_1_out, self.sim_Mem_OUT)
        self.refresh()
        
        self.mux_6.set_INPUTS(self.Xi, self.MULT_2_out, "[DontCare]")
        self.refresh()

        self.ADDSUB_1.set_INPUTS(self.mux_5_out, self.mux_6_out)
        self.refresh()

        self.mux_7.set_INPUTS(self.MULT_1_out, self.ADDSUB_1_OUT, "[DontCare]") 
        self.refresh()

        self.ADDSUB_2.set_INPUTS(self.mux_7_out, self.sim_Mem_OUT)
        self.refresh()
    
    def enableINT(self):
        self.allINT = True
        self.MULT_1.useINT = True
        self.MULT_2.useINT = True  
        self.ADDSUB_1.useINT = True 
        self.ADDSUB_2.useINT = True 
    
    def disableINT(self):
        self.allINT = False
        self.MULT_1.useINT = False
        self.MULT_2.useINT = False  
        self.ADDSUB_1.useINT = False 
        self.ADDSUB_2.useINT = False 

