// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAddSubMul32.h for the primary calling header

#include "VAddSubMul32___024root.h"
#include "VAddSubMul32__Syms.h"

void VAddSubMul32___024root___ctor_var_reset(VAddSubMul32___024root* vlSelf);

VAddSubMul32___024root::VAddSubMul32___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VAddSubMul32___024root___ctor_var_reset(this);
}

void VAddSubMul32___024root::__Vconfigure(VAddSubMul32__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VAddSubMul32___024root::~VAddSubMul32___024root() {
}

void VAddSubMul32___024root___settle__TOP__2(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___settle__TOP__2\n"); );
    // Init
    IData/*31:0*/ AddSubMul32__DOT___io_outAdd_T_2;
    IData/*31:0*/ AddSubMul32__DOT___io_outSub_T_2;
    // Body
    vlSelf->io_outMul = (0x1ffffffffULL & VL_MULS_QQQ(33,64,64, 
                                                      VL_EXTENDS_QI(64,32, vlSelf->AddSubMul32__DOT__input_0), 
                                                      VL_EXTENDS_QI(64,32, vlSelf->AddSubMul32__DOT__input_1)));
    AddSubMul32__DOT___io_outAdd_T_2 = (vlSelf->AddSubMul32__DOT__input_0 
                                        + vlSelf->AddSubMul32__DOT__input_1);
    AddSubMul32__DOT___io_outSub_T_2 = (vlSelf->AddSubMul32__DOT__input_0 
                                        - vlSelf->AddSubMul32__DOT__input_1);
    vlSelf->io_outAdd = (((QData)((IData)((AddSubMul32__DOT___io_outAdd_T_2 
                                           >> 0x1fU))) 
                          << 0x20U) | (QData)((IData)(AddSubMul32__DOT___io_outAdd_T_2)));
    vlSelf->io_outSub = (((QData)((IData)((AddSubMul32__DOT___io_outSub_T_2 
                                           >> 0x1fU))) 
                          << 0x20U) | (QData)((IData)(AddSubMul32__DOT___io_outSub_T_2)));
}

void VAddSubMul32___024root___eval_initial(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VAddSubMul32___024root___eval_settle(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___eval_settle\n"); );
    // Body
    VAddSubMul32___024root___settle__TOP__2(vlSelf);
}

void VAddSubMul32___024root___final(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___final\n"); );
}

void VAddSubMul32___024root___ctor_var_reset(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_in0 = VL_RAND_RESET_I(32);
    vlSelf->io_in1 = VL_RAND_RESET_I(32);
    vlSelf->io_outAdd = VL_RAND_RESET_Q(33);
    vlSelf->io_outSub = VL_RAND_RESET_Q(33);
    vlSelf->io_outMul = VL_RAND_RESET_Q(33);
    vlSelf->AddSubMul32__DOT__input_0 = VL_RAND_RESET_I(32);
    vlSelf->AddSubMul32__DOT__input_1 = VL_RAND_RESET_I(32);
}
