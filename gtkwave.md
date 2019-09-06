Error:
    Could not initialize GTK!  Is DISPLAY env var/xhost set?
Solution:

```console
export DISPLAY=:0.0
gtkwave file_name.vcd  
```

Save and load previous view

```console
gtkwave -a mod_decode_pipe/engine_0/view.gtkw mod_decode_pipe/engine_0/trace.vcd &
```
