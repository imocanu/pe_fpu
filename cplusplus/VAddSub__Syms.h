// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VADDSUB__SYMS_H_
#define VERILATED_VADDSUB__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "VAddSub.h"

// INCLUDE MODULE CLASSES
#include "VAddSub___024root.h"

// SYMS CLASS (contains all model state)
class VAddSub__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VAddSub* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VAddSub___024root              TOP;

    // CONSTRUCTORS
    VAddSub__Syms(VerilatedContext* contextp, const char* namep, VAddSub* modelp);
    ~VAddSub__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
