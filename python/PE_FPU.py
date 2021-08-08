from common import *

class MUX:
    def __init__(self):
        self.in1  = 0.0
        self.in2  = 0.0
        self.in3  = 0.0
        self.sel = 0
        self.out = 0.0

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
            self.out = self.in1

    def get_OUT(self):
        return self.out


class MULT:
    def __init__(self):
        self.in1  = 0.0
        self.in2  = 0.0
        self.round = ""
        self.op = True
        self.out = "empty"
    
    def set_INPUTS(self, in1, in2):
        self.in1 = in1
        self.in2 = in2
        self.calc()

    def calc(self):
        rez32 = core.single(self.in1) * core.single(self.in2)
        self.out = str(rez32)
        self.out = self.out.replace(" ", "")
        if DEBUG: 
            print(self.in1, "*", self.in2, "=", self.out)
    
    def get_OUT(self):
        return self.out
    

class ADDSUB:
    def __init__(self):
        self.in1  = 0.0
        self.in2  = 0.0
        self.round = ""
        self.op = False
        self.out = "empty"

    def set_INPUTS(self, in1, in2):
        self.in1  = in1
        self.in2  = in2
        self.calc()

    def calc(self):
        if(self.op):
            rez32 = core.single(self.in1) + core.single(self.in2)
            self.out = str(rez32)
            self.out = self.out.replace(" ", "")
            if DEBUG:
                print(self.in1, "+", self.in2, "=", self.out)
        else:
            rez32 = core.single(self.in1) - core.single(self.in2)
            self.out = str(rez32)
            self.out = self.out.replace(" ", "")
            if DEBUG:
                print(self.in1, "-", self.in2, "=", self.out)

    def get_OUT(self):
        return self.out


class PE_FPU:
    def __init__(self, Yi="", a1="", Xi="", B1="", Yj="", a2="", Xj="", B2=""):
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
        self.mux_2 = MUX()
        self.mux_3 = MUX()
        self.mux_4 = MUX()
        self.mux_5 = MUX()
        self.mux_6 = MUX()
        self.mux_7 = MUX()
        self.MULT_1 = MULT()
        self.MULT_2 = MULT()
        self.ADDSUB_1 = ADDSUB()
        self.ADDSUB_2 = ADDSUB()
        self.sim_Mem_OUT = "" 

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
