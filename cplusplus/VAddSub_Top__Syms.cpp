// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "VAddSub_Top__Syms.h"
#include "VAddSub_Top.h"
#include "VAddSub_Top___024root.h"

// FUNCTIONS
VAddSub_Top__Syms::~VAddSub_Top__Syms()
{
}

VAddSub_Top__Syms::VAddSub_Top__Syms(VerilatedContext* contextp, const char* namep,VAddSub_Top* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP(namep)
{
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(this, true);
}
