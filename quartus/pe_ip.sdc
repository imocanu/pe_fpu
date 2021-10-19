#                                                                              *
#  All information provided herein is provided on as as is basis,              *
#  without warranty of any kind.                                               *
#                                                                              *
#  File Name: top_dct.sdc                                                      *
#                                                                              *
#  File Function: This file contains the timing constraints for the PLL        *
#                 Optimization Lab; pll is included in this sdc.               *
#                                                                              *
# ******************************************************************************

#**************************************************************
# Time Information
#**************************************************************
# set_time_format -unit ns -decimal_places 3
# set_operating_conditions -model slow -temperature 85 -voltage 1100
#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {clk_in} -period 1000000000 -waveform { 0.000 5.000 } [get_ports {clock}]
#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks
#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty
#**************************************************************
# Set Input Delay
#**************************************************************
#set_input_delay -add_delay -clock [get_clocks {clk_in}] 1.500 [get_ports {async_rst}]
#set_input_delay -add_delay -clock [get_clocks {clk_in}] 1.200 [get_ports {data_in}]
##**************************************************************
## Set Output Delay
##**************************************************************
#set_output_delay -add_delay -clock [get_clocks {clk_in}] 2.000 [get_ports {data_out}]
##**************************************************************
## Set Multicycle Path
##**************************************************************
#set_multicycle_path -setup -end -from [get_keepers *] -to [get_keepers {reg2}] 2
