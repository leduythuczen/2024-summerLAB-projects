#SETUP LIB
set_app_var search_path "/home/hoangtrang/Desktop/icc_lab/logical_lib"
set_app_var target_library "NangateOpenCellLibrary_typical.db"
set_app_var link_library "* $target_library"

#REMOVE OLD LIB
sh rm -rf CHIP

#CREATE MILKYWAY LIB
create_mw_lib -tech "/home/hoangtrang/Desktop/icc_lab/tech/NangateOpenCellLibrary.tf" 	\
-mw_reference_library 									\
{/home/hoangtrang/Desktop/icc_lab/physical_lib/NangateOpenCellLibrary			\
/home/hoangtrang/Desktop/icc_lab/physical_lib/RF_2P_ADV64_16				\
/home/hoangtrang/Desktop/icc_lab/physical_lib/tpz}					\
-open CHIP						

set_tlu_plus_files		\
	-max_tluplus "/home/hoangtrang/Desktop/icc_lab/tluplus/NangateOpenCellLibrary.tluplus"	\
	-min_tluplus "/home/hoangtrang/Desktop/icc_lab/tluplus/NangateOpenCellLibrary.tluplus" \
	-tech2itf_map "/home/hoangtrang/Desktop/icc_lab/tluplus/NangateOpenCellLibrary.map"

import_design "./../04_synth/report/lab_synth.netlist.v" -format "verilog" -top "vending_machine" -cel "vending_machine"

read_sdc "./../04_synth/report/report.sdc"
