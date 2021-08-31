from common import *

class MUX:
    def __init__(self):
        self.id = 0
        self.in0  = constant_ZERO
        self.in1  = constant_ZERO
        self.in2  = constant_ZERO
        self.sel = 0
        self.out = constant_ZERO

    def set_Sel(self, val):
        self.sel = val

    def set_INPUTS(self, in0, in1, in2):
        self.in0  = in0
        self.in1  = in1
        self.in2  = in2
        self.calc()
    
    def calc(self):
        if(self.sel == 0):
            self.out = self.in0
        elif(self.sel == 1):
            self.out = self.in1
        elif(self.sel == 2):
            self.out = self.in2
        else:
            self.sel = 0
            self.out = self.in0
        
        if DEBUG:
            print("[ mux", self.id, "]", self.in0, ":", self.in1, ":", self.in2)
            print("         [sel]: ", self.sel , "-> out :", self.out)

    def get_OUT(self):
        return self.out


class MULT:
    def __init__(self):
        self.id = 0
        self.in0  = constant_ZERO
        self.in1  = constant_ZERO
        self.ba0 = constant_ZERO
        self.ba1 = constant_ZERO
        self.round = 0
        self.useINT = False
        self.out = constant_ZERO
    
    def set_INPUTS(self, in0, in1):
        self.in0 = in0
        self.in1 = in1
        self.ba0 = BitArray(bin=self.in0).int
        self.ba1 = BitArray(bin=self.in1).int
        self.calc()

    def calc(self):
        if(self.useINT):
            rez32 = np.multiply(self.ba0 , self.ba1, dtype=np.int32)
            self.out = str(np.binary_repr(rez32, width=32)) 
        else:
            rez32 = core.single(self.in0) * core.single(self.in1)
            self.out = str(rez32)
            self.out = self.out.replace(" ", "")

        if DEBUG: 
            print("[MULT", self.id, "]", self.in0, "*", self.in1, "=", self.out)
    
    def get_OUT(self):
        return self.out
    

class ADDSUB:
    def __init__(self):
        self.id = 0
        self.in0  = constant_ZERO
        self.in1  = constant_ZERO
        self.ba0 = 0
        self.ba1 = 0
        self.round = 0
        self.op = False
        self.useINT = False
        self.out = constant_ZERO

    def set_INPUTS(self, in0, in1):
        self.in0  = in0
        self.in1  = in1
        self.ba0 = BitArray(bin=self.in0).int
        self.ba1 = BitArray(bin=self.in1).int
        self.calc()

    def calc(self):
        if(self.op):
            if(self.useINT):
                rez32 = np.subtract(self.ba0 , self.ba1, dtype=np.int32)
                self.out = str(np.binary_repr(rez32, width=32))

            else: 
                rez32 = core.single(self.in0) - core.single(self.in1)
                self.out = str(rez32)
                self.out = self.out.replace(" ", "")

            if DEBUG:
                print("[ SUB", self.id, "]", self.in0, "-", self.in1, "=", self.out)
        else:
            if(self.useINT):
                    rez32 = np.sum([self.ba0 , self.ba1], dtype=np.int32)
                    self.out = str(np.binary_repr(rez32, width=32))
            else:
                rez32 = core.single(self.in0) + core.single(self.in1)
                self.out = str(rez32)
                self.out = self.out.replace(" ", "")

            if DEBUG:
                print("[ ADD", self.id, "]", self.in0, "+", self.in1, "=", self.out)

    def get_OUT(self):
        return self.out


class PE_FPU:
    def __init__(self, Yi="", a1="", Xi="", B1="", 
                       Yj="", a2="", Xj="", B2="", 
                       tosum_1=constant_ZERO, tosum_2=constant_ZERO, 
                       tosum_3=constant_ZERO, tosum_4=constant_ZERO):
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
        self.tosum_1 = tosum_1
        self.tosum_2 = tosum_2
        self.tosum_3 = tosum_3
        self.tosum_4 = tosum_4

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
        self.mux_8 = MUX()
        self.mux_8.id = 8
        self.mux_9 = MUX()
        self.mux_9.id = 9
        self.mux_10 = MUX()
        self.mux_10.id = 10
        self.MULT_1 = MULT()
        self.MULT_1.id = 1
        self.MULT_2 = MULT()
        self.MULT_2.id = 2
        self.ADDSUB_1 = ADDSUB()
        self.ADDSUB_1.id = 1
        self.ADDSUB_2 = ADDSUB()
        self.ADDSUB_2.id = 2

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
        self.mux_8_out = self.mux_8.get_OUT()
        self.mux_9_out = self.mux_9.get_OUT()
        self.mux_10_out = self.mux_10.get_OUT()
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
        self.mux_8_out = self.mux_8.get_OUT()
        self.mux_9_out = self.mux_9.get_OUT()
        self.mux_10_out = self.mux_10.get_OUT()
        self.MULT_1_out = self.MULT_1.get_OUT()
        self.MULT_2_out = self.MULT_2.get_OUT()
        self.ADDSUB_1_OUT = self.ADDSUB_1.get_OUT()
        self.ADDSUB_2_OUT = self.ADDSUB_2.get_OUT()


    def clock_PE(self):
        self.clock = self.clock + 1
        
        if DEBUG:
            print("~"*50)
            print("***> Start CLOCK [",str(self.clock),"] - PE_V2 - useINT ", self.allINT, "<***")
            print("~"*50)
        
        self.refresh()
        self.mux_1.set_INPUTS(self.Xi, self.ADDSUB_1_OUT, "[DontCare]")
        self.refresh()
        self.mux_2.set_INPUTS(self.Yi, self.ADDSUB_1_OUT, "[DontCare]")
        self.refresh()

        self.mux_3.set_INPUTS( self.Xj, self.ADDSUB_2_OUT,"[DontCare]")
        self.refresh()
        self.mux_4.set_INPUTS( self.Yj, self.ADDSUB_2_OUT,"[DontCare]")
        self.refresh()

        self.MULT_1.set_INPUTS(self.mux_1_out, self.mux_2_out)
        self.refresh()
        self.MULT_2.set_INPUTS(self.mux_3_out, self.mux_4_out)
        self.refresh()

        self.mux_5.set_INPUTS(self.tosum_1, self.Xi, self.MULT_1_out)
        self.refresh()
        
        self.mux_6.set_INPUTS(self.tosum_2, self.Yi, self.MULT_2_out)
        self.refresh()

        self.mux_7.set_INPUTS(self.tosum_3, self.Xj, self.MULT_2_out)
        self.refresh()
        
        self.mux_8.set_INPUTS(self.tosum_4, self.Yj, self.MULT_1_out)
        self.refresh()

        self.ADDSUB_1.set_INPUTS(self.mux_5_out, self.mux_6_out)
        self.refresh()

        self.ADDSUB_2.set_INPUTS(self.mux_7_out, self.mux_8_out)
        self.refresh()

        self.mux_9.set_INPUTS(self.ADDSUB_1_OUT, self.MULT_1_out, "[DontCare]")
        self.refresh()
        
        self.mux_10.set_INPUTS(self.ADDSUB_2_OUT, self.MULT_2_out, "[DontCare]")
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

