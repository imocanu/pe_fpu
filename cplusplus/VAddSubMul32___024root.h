// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VAddSubMul32.h for the primary calling header

#ifndef VERILATED_VADDSUBMUL32___024ROOT_H_
#define VERILATED_VADDSUBMUL32___024ROOT_H_  // guard

#include "verilated_heavy.h"

class VAddSubMul32__Syms;
VL_MODULE(VAddSubMul32___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    CData/*0:0*/ __Vclklast__TOP__clock;
    VL_IN(io_in0,31,0);
    VL_IN(io_in1,31,0);
    IData/*31:0*/ AddSubMul32__DOT__input_0;
    IData/*31:0*/ AddSubMul32__DOT__input_1;
    VL_OUT64(io_outAdd,32,0);
    VL_OUT64(io_outSub,32,0);
    VL_OUT64(io_outMul,32,0);

    // INTERNAL VARIABLES
    VAddSubMul32__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    VAddSubMul32___024root(const char* name);
    ~VAddSubMul32___024root();
    VL_UNCOPYABLE(VAddSubMul32___024root);

    // INTERNAL METHODS
    void __Vconfigure(VAddSubMul32__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
