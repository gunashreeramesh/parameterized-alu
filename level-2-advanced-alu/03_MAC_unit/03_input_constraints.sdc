# Clock definition
create_clock -name clk -period 10 [get_ports clk]

# Input delays
set_input_delay 2 -clock clk [get_ports A]
set_input_delay 2 -clock clk [get_ports B]
set_input_delay 2 -clock clk [get_ports reset]
set_input_delay 2 -clock clk [get_ports enable]

# Output delay
set_output_delay 2 -clock clk [get_ports ACC]

# Input drive
set_driving_cell -lib_cell INVX1 [get_ports A]
set_driving_cell -lib_cell INVX1 [get_ports B]
set_driving_cell -lib_cell INVX1 [get_ports reset]
set_driving_cell -lib_cell INVX1 [get_ports enable]

# Output load
set_load 0.05 [get_ports ACC]
