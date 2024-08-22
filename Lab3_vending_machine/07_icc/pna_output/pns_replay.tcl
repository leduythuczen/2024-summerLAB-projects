# reset
set_fp_rail_constraints -remove_all_layers
remove_fp_virtual_pad -all              
set_fp_rail_strategy -reset             
set_fp_block_ring_constraints -remove_all
set_fp_rail_region_constraints  -remove 
# global constraints
set_fp_rail_constraints -set_global -no_routing_over_hard_macros 

# layer constraints
set_fp_rail_constraints -add_layer  -layer metal5 -direction horizontal -max_strap 10 -min_strap 3 -max_width 4.000000 -min_width 4.000000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal4 -direction vertical -max_strap 10 -min_strap 3 -max_width 4.000000 -min_width 4.000000 -spacing minimum 

# ring and strap constraints
set_fp_rail_constraints  -set_ring -nets { VDD VSS VDD VSS VDD VSS } -horizontal_ring_layer { metal5 } -vertical_ring_layer { metal4 } -ring_width 8.000000 -ring_offset 3.000000 -extend_strap core_ring 

# strategies
set_fp_rail_strategy  -use_tluplus true 

# block ring constraints

# regions

# virtual pads

# synthesize_fp_rail 
synthesize_fp_rail -nets { VDD VSS } -voltage_supply 1.300000 -power_budget 1000.000000   
