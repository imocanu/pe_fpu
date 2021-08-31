from common import *
from PE_FPU import ADDSUB

class PE_SUM():
    def __init__(self):
        self.in_0 = 0
        self.in_1 = 0
        self.in_2 = 0
        self.in_3 = 0
        self.ADDSUB_0 = ADDSUB()
        self.ADDSUB_0.id = 0
        self.ADDSUB_1 = ADDSUB()
        self.ADDSUB_1.id = 1
        self.ADDSUB_2 = ADDSUB()
        self.ADDSUB_2.id = 2

        self.ADDSUB_0_OUT = self.ADDSUB_0.get_OUT()
        self.ADDSUB_1_OUT = self.ADDSUB_1.get_OUT()
        self.ADDSUB_2_OUT = self.ADDSUB_2.get_OUT()
    
    def setInputs(self, in_0=0, in_1=0, 
                        in_2=0, in_3=0):
        self.in_0 = in_0
        self.in_1 = in_1
        self.in_2 = in_2
        self.in_3 = in_3

    def refresh():
        self.ADDSUB_0_OUT = self.ADDSUB_0.get_OUT()
        self.ADDSUB_1_OUT = self.ADDSUB_1.get_OUT()
        self.ADDSUB_2_OUT = self.ADDSUB_2.get_OUT()
    
    def use_V_1():
        # Two Inputs -> One SUM module -> One Output
        self.ADDSUB_0.set_INPUTS(self.in_0, self.in_1)
        self.refresh()
    
    def get_OUT_V_1(self):
        return self.out = self.ADDSUB_0_OUT

    def use_V_2():
        # Four Inputs -> Three SUM modules -> One Output
        self.ADDSUB_0.set_INPUTS(self.in_0, self.in_1)
        self.refresh()
        self.ADDSUB_1.set_INPUTS(self.in_2, self.in_3)
        self.refresh()
        self.ADDSUB_2.set_INPUTS(self.ADDSUB_0_OUT, self.ADDSUB_1_OUT)
        self.refresh()
    
    def get_OUT_V_2(self):
        return self.out = self.ADDSUB_2_OUT

