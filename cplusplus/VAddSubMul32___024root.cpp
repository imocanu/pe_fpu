// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VAddSubMul32.h for the primary calling header

#include "VAddSubMul32___024root.h"
#include "VAddSubMul32__Syms.h"

VL_INLINE_OPT void VAddSubMul32___024root___sequent__TOP__1(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___sequent__TOP__1\n"); );
    // Init
    IData/*31:0*/ AddSubMul32__DOT___io_outAdd_T_2;
    IData/*31:0*/ AddSubMul32__DOT___io_outSub_T_2;
    // Body
    vlSelf->AddSubMul32__DOT__input_0 = vlSelf->io_in0;
    vlSelf->AddSubMul32__DOT__input_1 = vlSelf->io_in1;
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

void VAddSubMul32___024root___eval(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VAddSubMul32___024root___sequent__TOP__1(vlSelf);
    }
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VAddSubMul32___024root___change_request_1(VAddSubMul32___024root* vlSelf);

VL_INLINE_OPT QData VAddSubMul32___024root___change_request(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___change_request\n"); );
    // Body
    return (VAddSubMul32___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VAddSubMul32___024root___change_request_1(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VAddSubMul32___024root___eval_debug_assertions(VAddSubMul32___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VAddSubMul32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VAddSubMul32___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
