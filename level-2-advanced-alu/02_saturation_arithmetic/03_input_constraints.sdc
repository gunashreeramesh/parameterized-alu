# Input delays
set_input_delay 2 [get_ports A]
set_input_delay 2 [get_ports B]
set_input_delay 2 [get_ports operation]

# Output delay
set_output_delay 2 [get_ports Y]

# Input drive
set_driving_cell -lib_cell INVX1 [get_ports A]
set_driving_cell -lib_cell INVX1 [get_ports B]
set_driving_cell -lib_cell INVX1 [get_ports operation]

# Output load
set_load 0.05 [get_ports Y]
