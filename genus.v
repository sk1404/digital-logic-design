#genus steps

#library file 

read_lib /home/pgstudent12/counter_design_database_45nm/lib/slow_vdd1v0_basicCells.lib 
read_hdl sd1011.v
elaborate

gui_show
read_sdc sd1011fsm.sdc
syn_generic

