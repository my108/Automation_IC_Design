# Create results directory if it doesn't exist
file mkdir results
open_project [pwd]/Automation/Project_2.xpr
set_property source_mgmt_mode None [current_project]
update_compile_order -fileset sources_1
# Get a list of all files in the project
set file_list [get_files -filter {file_type == "Verilog"}]

# Iterate over each file in the project
foreach file_path $file_list {
    # Extract file name without extension
    set file_name [file root [file tail $file_path]]
    
    # Create a directory for each file
    set directory_name [file join results $file_name]
    file mkdir $directory_name
    
    # Open the project and set the top module
    set_property top $file_name [current_fileset]
    
    # Synthesis
    reset_run synth_1
    launch_runs synth_1 -jobs 30
    wait_on_run synth_1
    
    # Check if synthesis failed
    set synth_result [get_property STATUS [get_runs synth_1]]
    if {$synth_result == "synth_design ERROR"} {
        continue ;# Skip to the next iteration
    }
    
    # Implementation
    reset_run impl_1
    launch_runs impl_1 -jobs 30
    wait_on_run impl_1
    
    # Open implementation run and generate reports
    open_run impl_1
    report_power > [file join $directory_name power.txt]
    report_timing > [file join $directory_name timing.txt]
    report_utilization > [file join $directory_name utilization.txt]
    
    # Close project
}
close_project

