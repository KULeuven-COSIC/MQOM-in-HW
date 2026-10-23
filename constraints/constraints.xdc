# 260 MHz clock
create_clock -period 3.85 -waveform {0 1.925} -name clk -add [get_ports clk]

# 0 ns input/output delays w.r.t. the clock
set_input_delay  0 [get_ports {start_comm[*] rst}] -clock clk

# Ignore timing analysis for outputs
set_false_path -to [get_ports {bad_sig done}]
