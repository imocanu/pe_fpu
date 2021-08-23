// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VMult.h for the primary calling header

#ifndef VERILATED_VMULT___024ROOT_H_
#define VERILATED_VMULT___024ROOT_H_  // guard

#include "verilated_heavy.h"

class VMult__Syms;
VL_MODULE(VMult___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_useINT,0,0);
    VL_IN8(io_round,2,0);
    CData/*0:0*/ Mult__DOT__useINT_sel;
    CData/*2:0*/ Mult__DOT__round_mode;
    CData/*3:0*/ Mult__DOT__recFN_from_fN_in1_hi;
    CData/*3:0*/ Mult__DOT__recFN_from_fN_in2_hi;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_isZero;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___DOT__mulFullRaw_io_rawOut_sign;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__isNaNOut;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMinNonzeroMagOut;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__pegMaxFiniteMagOut;
    CData/*0:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__notNaN_isInfOut;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__common_overflow;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__invalidExc;
    CData/*0:0*/ Mult__DOT__recFNToIN__DOT__excSign;
    CData/*0:0*/ __Vclklast__TOP__clock;
    SData/*8:0*/ Mult__DOT__out_FP32_hi;
    SData/*10:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__sRoundedExp;
    SData/*9:0*/ Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi;
    SData/*9:0*/ Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__io_out_hi;
    VL_IN(io_in1,31,0);
    VL_IN(io_in2,31,0);
    IData/*31:0*/ Mult__DOT__fN_in1;
    IData/*31:0*/ Mult__DOT__fN_in2;
    IData/*28:0*/ Mult__DOT__recFN_from_fN_in1_lo;
    IData/*28:0*/ Mult__DOT__recFN_from_fN_in2_lo;
    IData/*31:0*/ Mult__DOT__recFNToIN_out;
    IData/*22:0*/ Mult__DOT__out_FP32_lo;
    IData/*31:0*/ Mult__DOT__out_FP32;
    IData/*26:0*/ Mult__DOT__mulRecFN__DOT__mulRawFN___05Fio_rawOut_sig;
    IData/*25:0*/ Mult__DOT__mulRecFN__DOT__roundRawFNToRecFN__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*25:0*/ Mult__DOT__iNToRecFN_1__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*25:0*/ Mult__DOT__iNToRecFN_2__DOT__roundAnyRawFNToRecFN__DOT__roundedSig;
    IData/*31:0*/ Mult__DOT__recFNToIN__DOT__roundedInt;
    VL_OUT64(io_out,32,0);
    QData/*32:0*/ Mult__DOT__iNToRecFN_1_out;
    QData/*32:0*/ Mult__DOT__iNToRecFN_2_out;
    QData/*32:0*/ Mult__DOT__recFN_from_fN_in1;
    QData/*32:0*/ Mult__DOT__recFN_from_fN_in2;
    QData/*32:0*/ Mult__DOT__mulRecFN_out;
    QData/*62:0*/ Mult__DOT__iNToRecFN_1__DOT___intAsRawFloat_sig_T;
    QData/*62:0*/ Mult__DOT__iNToRecFN_2__DOT___intAsRawFloat_sig_T;

    // INTERNAL VARIABLES
    VMult__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    VMult___024root(const char* name);
    ~VMult___024root();
    VL_UNCOPYABLE(VMult___024root);

    // INTERNAL METHODS
    void __Vconfigure(VMult__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
