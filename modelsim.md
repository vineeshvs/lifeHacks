##### Seeing ? symbols in the .lst file?
Solution: 

* Add those signals to the wave window.
* Save that wave format into a .do file
* In the modelsim tcl file, load that .do file.

##### View schematic of a VHDL file in Modelsim
* Go to SIM tab in the panel after simulation
* Right click on the top module name and ADD -> TO SCHEMATIC -> SELECTED REGION
* Go to SCHEMATIC tab
    * Drag and select all items in the region
    * Right click on it
    * EXPAND NET TO -> DESIGN INPUTS        

##### Error invoking modelsim in VLSI Lab, IITB
Error: /cad2/mentor/modelsim_10.0/modeltech/bin/../linux/vish: error while loading shared libraries: libXft.so.2: wrong ELF class: ELFCLASS64
Solution:
* Log in  (Do SSH)
```console
source cad3/digitalbashrc
```

* If you do 
```console source /cad/digital/bashrc``` before the above command, it will give this error
    
