###################################################################

# Created by write_sdc on Wed Oct 27 20:47:02 2021

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_fanout_load 8 [get_ports out_water]
set_fanout_load 8 [get_ports out5]
set_fanout_load 8 [get_ports out10]
set_fanout_load 8 [get_ports out15]
create_clock [get_ports clk]  -period 40  -waveform {0 10}
set_input_delay -clock clk  -max 10  [get_ports clk]
set_input_delay -clock clk  -min 1  [get_ports clk]
set_input_delay -clock clk  -max 10  [get_ports rst]
set_input_delay -clock clk  -min 1  [get_ports rst]
set_input_delay -clock clk  -max 10  [get_ports buy]
set_input_delay -clock clk  -min 1  [get_ports buy]
set_input_delay -clock clk  -max 10  [get_ports cancel]
set_input_delay -clock clk  -min 1  [get_ports cancel]
set_input_delay -clock clk  -max 10  [get_ports in5]
set_input_delay -clock clk  -min 1  [get_ports in5]
set_input_delay -clock clk  -max 10  [get_ports in10]
set_input_delay -clock clk  -min 1  [get_ports in10]
set_output_delay -clock clk  -max 10  [get_ports out_water]
set_output_delay -clock clk  -min 1  [get_ports out_water]
set_output_delay -clock clk  -max 10  [get_ports out5]
set_output_delay -clock clk  -min 1  [get_ports out5]
set_output_delay -clock clk  -max 10  [get_ports out10]
set_output_delay -clock clk  -min 1  [get_ports out10]
set_output_delay -clock clk  -max 10  [get_ports out15]
set_output_delay -clock clk  -min 1  [get_ports out15]
