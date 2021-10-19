# Copyright (C) 2021  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: pe_ip.tcl
# Generated on: Tue Oct 19 16:35:42 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "pe_ip"]} {
		puts "Project pe_ip is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists pe_ip]} {
		project_open -revision pe_ip pe_ip
	} else {
		project_new -revision pe_ip pe_ip
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Arria 10"
	set_global_assignment -name TOP_LEVEL_ENTITY PE_CTRL_8IP_QUARTUS
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 21.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:32:43  OCTOBER 19, 2021"
	set_global_assignment -name LAST_QUARTUS_VERSION "21.1.0 Pro Edition"
	set_global_assignment -name DEVICE 10AX115H1F34I1SG
	set_global_assignment -name PROJECT_IP_REGENERATION_POLICY NEVER_REGENERATE_IP
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP "-40"
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name SDC_FILE pe_ip.sdc
	set_global_assignment -name VERILOG_FILE verilog/PE_CTRL_8IP_QUARTUS_tb.v
	set_global_assignment -name VERILOG_FILE verilog/PE_CTRL_8IP_QUARTUS.v

	# Including default assignments
	set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON -family "Arria 10"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "Arria 10"
	set_global_assignment -name TIMING_ANALYZER_DO_CCPP_REMOVAL ON -family "Arria 10"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "Arria 10"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 3 -family "Arria 10"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Arria 10"
	set_global_assignment -name USE_ADVANCED_DETAILED_LAB_LEGALITY ON -family "Arria 10"
	set_global_assignment -name ADVANCED_PHYSICAL_SYNTHESIS_REGISTER_PACKING OFF -family "Arria 10"
	set_global_assignment -name PHYSICAL_SYNTHESIS OFF -family "Arria 10"
	set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "PASSIVE SERIAL" -family "Arria 10"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "Arria 10"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "Arria 10"
	set_global_assignment -name PROGRAMMABLE_POWER_TECHNOLOGY_SETTING AUTOMATIC -family "Arria 10"
	set_global_assignment -name ENABLE_PHYSICAL_DSP_MERGING OFF -family "Arria 10"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "Arria 10"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN ON -family "Arria 10"
	set_global_assignment -name ACTIVE_SERIAL_CLOCK FREQ_100MHZ -family "Arria 10"
	set_global_assignment -name GENERATE_PR_RBF_FILE OFF -family "Arria 10"
	set_global_assignment -name POWER_USE_DEVICE_CHARACTERISTICS TYPICAL -family "Arria 10"
	set_global_assignment -name POWER_AUTO_COMPUTE_TJ ON -family "Arria 10"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
