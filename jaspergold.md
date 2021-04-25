#### Fixing the error due to missing libpng12-0

Error

    $ Warning: "Ubuntu 20.04.2 LTS" is an unsupported OS, exiting.
    See /home/vineesh/software/jaspergold/jasper_2017.09_FCS__XLM17.04/doc/INSTALL.pdf for a list of supported platforms.
    Use -allow_unsupported_OS to suppress this warning at your own risk.
    /home/vineesh/software/jaspergold/jasper_2017.09_FCS__XLM17.04/Linux64/bin/jg_console: error while loading shared libraries: libpng12.so.0: cannot open shared object file: No such file or directory

Fix

    sudo add-apt-repository ppa:linuxuprising/libpng12
    sudo apt update
    sudo apt install libpng12-0

[Credits](https://askubuntu.com/questions/1256637/troubles-with-libpng12-so-0-no-version-information-available)

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
