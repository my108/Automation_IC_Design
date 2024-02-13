# Automation_IC_Design

This repository contains scripts for automating the synthesis and implementation of Verilog files present in the `verilog_folder` directory using TCL and Python scripts. There are two TCL scripts provided:

1. `tcl_ad.tcl`: This script creates a project in Vivado and adds all the Verilog files present in the `verilog_folder` directory.
   
2. `tcl_run_re.tcl`: This script opens the project, runs synthesis and implementation for all the Verilog files in the project, and stores power, timing, and utilization reports. It creates a folder/directory for each Verilog file in the `results` directory and adds the reports for each module to a text file. If a code is not synthesizable, it continues to the next module in the queue.

Additionally, there is a Jupyter Notebook file named `Tcl_Scripting.ipynb`. This notebook contains the code to run the above two TCL files and to extract important data from each report text file. It then creates a CSV file from this data.

The `verilog_folder` directory contains a total of 6 Verilog files. Out of these, one file named `div.v` is not synthesizable. Here are the descriptions of the Verilog files:

1. `adder.v`: Code for a 1-bit full adder.
2. `counter.v`: Code for a 4-bit counter.
3. `d_flop.v`: Code for a D flip flop.
4. `div.v`: Code for division of numbers with 100000 bits (not synthesizable).
5. `mul.v`: Code for a 4-bit multiplier.
6. `shift.v`: Code for a 4-bit universal shift register.

This repository provides automation scripts for the synthesis and implementation of Verilog files, along with handling non-synthesizable code scenarios and extracting essential data from reports for analysis.
