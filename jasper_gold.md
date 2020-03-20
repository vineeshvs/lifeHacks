#### Using markers in the wave window.

* Add marker
Shift + left mouse click

* Display value of the waves at the marker position.
View -> Show trace values.

#### Load waveform from .sig file

Commands to be used
```console
set_visualize_preload_signal_list name_of_sig_file.sig
get_visualize_preload_signal_list
```

Example tcl file

```console
set_proofgrid_manager on
analyze -clear
analyze -sva mesi_isc.v
elaborate -top mesi_isc
clock -clear
clock clk
reset -clear
reset rst
#set_engine_mode  M
set_engine_mode default
prove -all
get_superlint_prove_memory_limit
get_proofgrid_manager
set_visualize_preload_signal_list sig_fifos.sig
get_visualize_preload_signal_list
```
