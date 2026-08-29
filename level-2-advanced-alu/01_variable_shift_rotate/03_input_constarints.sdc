# Clock definition
create_clock -name clk -period 10

# Input delays
set_input_delay 2 -clock clk [get_ports A]
set_input_delay 2 -clock clk [get_ports shamt]
set_input_delay 2 -clock clk [get_ports mode]
set_input_delay 2 -clock clk [get_ports direction]

# Output delay
set_output_delay 2 -clock clk [get_ports Y]

# Input drive
set_driving_cell -lib_cell INVX1 [get_ports A]
set_driving_cell -lib_cell INVX1 [get_ports shamt]
set_driving_cell -lib_cell INVX1 [get_ports mode]
set_driving_cell -lib_cell INVX1 [get_ports direction]

# Output load
set_load 0.05 [get_ports Y]
