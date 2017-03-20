#### View schematic of a VHDL file in Modelsim
* Go to SIM tab in the panel after simulation
* Right click on the top module name and ADD -> TO SCHEMATIC -> SELECTED REGION
* Go to SCHEMATIC tab
    * Drag and select all items in the region
    * Right click on it
    * EXPAND NET TO -> DESIGN INPUTS        

### Error invoking modelsim in VLSI Lab, IITB
Error: /cad2/mentor/modelsim_10.0/modeltech/bin/../linux/vish: error while loading shared libraries: libXft.so.2: wrong ELF class: ELFCLASS64
Solution:
1. Log in  (Do SSH)
2. ```source cad3/digitalbashrc```
3. If you do ```source /cad/digital/bashrc``` before the above command, it will give this error
    
