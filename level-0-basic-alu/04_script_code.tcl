# Set library
set_db library /path/to/your/standard_cell_library.lib

# Read RTL
read_hdl parameterized_alu.v

# Elaborate design
elaborate parameterized_alu

# Read constraints
read_sdc input_constraints.sdc

# Synthesis
syn_generic
syn_map
syn_opt

# Reports
report_timing > timing_report.txt
report_area > area_report.txt
report_power > power_report.txt

# Write synthesized netlist
write_hdl > synthesized_alu.v

# Write constraints
write_sdc > output_constraints.sdc
