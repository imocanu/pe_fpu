// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VAddSub.h for the primary calling header

#ifndef VERILATED_VADDSUB___024ROOT_H_
#define VERILATED_VADDSUB___024ROOT_H_  // guard

#include "verilated_heavy.h"

class VAddSub__Syms;
VL_MODULE(VAddSub___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_op,0,0);
    VL_IN8(io_useINT,0,0);
    CData/*0:0*/ AddSub__DOT__op_sel;
    CData/*3:0*/ AddSub__DOT__recFN_from_fN_in1_hi;
    CData/*3:0*/ AddSub__DOT__recFN_from_fN_in2_hi;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_a_isInf;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_b_isInf;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_isZero;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__effSignB;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__eqSigns;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__closeSubMags;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__notNaN_specialCase;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut;
    CData/*0:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut;
    CData/*0:0*/ AddSub__DOT__recFNToIN__DOT__common_overflow;
    CData/*0:0*/ AddSub__DOT__recFNToIN__DOT__invalidExc;
    CData/*0:0*/ AddSub__DOT__recFNToIN__DOT__excSign;
    CData/*0:0*/ __Vclklast__TOP__clock;
    SData/*8:0*/ AddSub__DOT__out_IEEE_FP32_hi;
    SData/*9:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__sDiffExps;
    SData/*10:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp;
    SData/*9:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi;
    SData/*9:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi;
    VL_IN(io_in1,31,0);
    VL_IN(io_in2,31,0);
    IData/*31:0*/ AddSub__DOT__fN_in1;
    IData/*31:0*/ AddSub__DOT__fN_in2;
    IData/*28:0*/ AddSub__DOT__recFN_from_fN_in1_lo;
    IData/*28:0*/ AddSub__DOT__recFN_from_fN_in2_lo;
    IData/*31:0*/ AddSub__DOT__recFNToIN_out;
    IData/*22:0*/ AddSub__DOT__out_IEEE_FP32_lo;
    IData/*31:0*/ AddSub__DOT__out_IEEE_FP32;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___05Fio_rawOut_sig;
    IData/*26:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT__close_sSigSum;
    IData/*25:0*/ AddSub__DOT__addRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*25:0*/ AddSub__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*25:0*/ AddSub__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*31:0*/ AddSub__DOT__recFNToIN__DOT__roundedInt;
    VL_OUT64(io_out,32,0);
    QData/*32:0*/ AddSub__DOT__addRecFN_io_a;
    QData/*32:0*/ AddSub__DOT__iNToRecFN_1_out;
    QData/*32:0*/ AddSub__DOT__iNToRecFN_2_out;
    QData/*32:0*/ AddSub__DOT__recFN_from_fN_in1;
    QData/*32:0*/ AddSub__DOT__recFN_from_fN_in2;
    QData/*32:0*/ AddSub__DOT__addRecFN_out;
    QData/*56:0*/ AddSub__DOT__addRecFN__DOT__addRawFN___DOT___close_sigOut_T;
    QData/*62:0*/ AddSub__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T;
    QData/*62:0*/ AddSub__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T;

    // INTERNAL VARIABLES
    VAddSub__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    VAddSub___024root(const char* name);
    ~VAddSub___024root();
    VL_UNCOPYABLE(VAddSub___024root);

    // INTERNAL METHODS
    void __Vconfigure(VAddSub__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
