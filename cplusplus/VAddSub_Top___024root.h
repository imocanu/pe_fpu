// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VAddSub_Top.h for the primary calling header

#ifndef VERILATED_VADDSUB_TOP___024ROOT_H_
#define VERILATED_VADDSUB_TOP___024ROOT_H_  // guard

#include "verilated_heavy.h"

class VAddSub_Top__Syms;
VL_MODULE(VAddSub_Top___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_op,0,0);
    VL_IN8(io_useINT,0,0);
    VL_IN8(io_round,2,0);
    VL_IN(io_in1,31,0);
    VL_IN(io_in2,31,0);
    VL_OUT64(io_outIEEE,32,0);

    // INTERNAL VARIABLES
    VAddSub_Top__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    VAddSub_Top___024root(const char* name);
    ~VAddSub_Top___024root();
    VL_UNCOPYABLE(VAddSub_Top___024root);

    // INTERNAL METHODS
    void __Vconfigure(VAddSub_Top__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
