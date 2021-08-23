// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VMult.h"
#include "VMult__Syms.h"

//============================================================
// Constructors

VMult::VMult(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VMult__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_useINT{vlSymsp->TOP.io_useINT}
    , io_round{vlSymsp->TOP.io_round}
    , io_in1{vlSymsp->TOP.io_in1}
    , io_in2{vlSymsp->TOP.io_in2}
    , io_out{vlSymsp->TOP.io_out}
    , rootp{&(vlSymsp->TOP)}
{
}

VMult::VMult(const char* _vcname__)
    : VMult(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VMult::~VMult() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VMult___024root___eval_initial(VMult___024root* vlSelf);
void VMult___024root___eval_settle(VMult___024root* vlSelf);
void VMult___024root___eval(VMult___024root* vlSelf);
QData VMult___024root___change_request(VMult___024root* vlSelf);
#ifdef VL_DEBUG
void VMult___024root___eval_debug_assertions(VMult___024root* vlSelf);
#endif  // VL_DEBUG
void VMult___024root___final(VMult___024root* vlSelf);

static void _eval_initial_loop(VMult__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VMult___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VMult___024root___eval_settle(&(vlSymsp->TOP));
        VMult___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VMult___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/Mult.v", 609, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VMult___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VMult::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VMult::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VMult___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VMult___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VMult___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("rtl/Mult.v", 609, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VMult___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VMult::final() {
    VMult___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VMult::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VMult::name() const {
    return vlSymsp->name();
}
