# Clock definition
create_clock -name clk -period 10 [get_ports clk]

# Input delays
set_input_delay 2 -clock clk [get_ports read_addr1]
set_input_delay 2 -clock clk [get_ports read_addr2]
set_input_delay 2 -clock clk [get_ports write_addr]
set_input_delay 2 -clock clk [get_ports write_data]
set_input_delay 2 -clock clk [get_ports reset]
set_input_delay 2 -clock clk [get_ports write_enable]

# Output delays
set_output_delay 2 -clock clk [get_ports read_data1]
set_output_delay 2 -clock clk [get_ports read_data2]

# Input drive
set_driving_cell -lib_cell INVX1 [get_ports read_addr1]
set_driving_cell -lib_cell INVX1 [get_ports read_addr2]
set_driving_cell -lib_cell INVX1 [get_ports write_addr]
set_driving_cell -lib_cell INVX1 [get_ports write_data]
set_driving_cell -lib_cell INVX1 [get_ports reset]
set_driving_cell -lib_cell INVX1 [get_ports write_enable]

# Output load
set_load 0.05 [get_ports read_data1]
set_load 0.05 [get_ports read_data2]
