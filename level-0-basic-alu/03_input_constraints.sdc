# Input delay constraints
set_input_delay 2.0 -clock virtual_clock [get_ports A]
set_input_delay 2.0 -clock virtual_clock [get_ports B]
set_input_delay 1.0 -clock virtual_clock [get_ports op]

# Output delay constraint
set_output_delay 2.0 -clock virtual_clock [get_ports Y]

# Input transition
set_input_transition 0.1 [get_ports A]
set_input_transition 0.1 [get_ports B]
set_input_transition 0.1 [get_ports op]

# Output load
set_load 0.05 [get_ports Y]
