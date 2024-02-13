# Creates a new Vivado project
create_project -force [pwd]/Automation/Project_2 -part xc7a200tfbg676-2
set_property board_part xilinx.com:ac701:part0:1.4 [current_project]

# Function to add Verilog files from a folder
proc add_verilog_files {folder_path} {
    # Get a list of Verilog files in the specified folder
    set verilog_files [glob -directory $folder_path *.v]

    # Loop through the list and add each file to the project
    foreach file $verilog_files {
        add_files -norecurse $file
    }
}

# Call the function with the folder containing Verilog files
add_verilog_files "[pwd]/verilog_folder"

# Update compile order
update_compile_order -fileset sources_1

# Close the project
close_project

