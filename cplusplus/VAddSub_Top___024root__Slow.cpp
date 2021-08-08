// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAddSub_Top.h for the primary calling header

#include "VAddSub_Top___024root.h"
#include "VAddSub_Top__Syms.h"

void VAddSub_Top___024root___ctor_var_reset(VAddSub_Top___024root* vlSelf);

VAddSub_Top___024root::VAddSub_Top___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VAddSub_Top___024root___ctor_var_reset(this);
}

void VAddSub_Top___024root::__Vconfigure(VAddSub_Top__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VAddSub_Top___024root::~VAddSub_Top___024root() {
}

void VAddSub_Top___024root___eval_initial(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___eval_initial\n"); );
}

void VAddSub_Top___024root___combo__TOP__1(VAddSub_Top___024root* vlSelf);

void VAddSub_Top___024root___eval_settle(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___eval_settle\n"); );
    // Body
    VAddSub_Top___024root___combo__TOP__1(vlSelf);
}

void VAddSub_Top___024root___final(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___final\n"); );
}

void VAddSub_Top___024root___ctor_var_reset(VAddSub_Top___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSub_Top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSub_Top___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_in1 = VL_RAND_RESET_I(32);
    vlSelf->io_in2 = VL_RAND_RESET_I(32);
    vlSelf->io_op = VL_RAND_RESET_I(1);
    vlSelf->io_useINT = VL_RAND_RESET_I(1);
    vlSelf->io_round = VL_RAND_RESET_I(3);
    vlSelf->io_outIEEE = VL_RAND_RESET_Q(33);
}
