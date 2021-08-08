// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VADDSUB_TOP__SYMS_H_
#define VERILATED_VADDSUB_TOP__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "VAddSub_Top.h"

// INCLUDE MODULE CLASSES
#include "VAddSub_Top___024root.h"

// SYMS CLASS (contains all model state)
class VAddSub_Top__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VAddSub_Top* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VAddSub_Top___024root          TOP;

    // CONSTRUCTORS
    VAddSub_Top__Syms(VerilatedContext* contextp, const char* namep, VAddSub_Top* modelp);
    ~VAddSub_Top__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
