18/01/2016:
-----------

    Installing VIS model checker
    ----------------------------

        Download from: http://vlsi.colorado.edu/~vis/vis_files_2.4.html

        Note: First do the installation of glu and then install vis or vl2mv (order doesn't matter)

        Installation: Follow the steps in the VIS README file in http://vlsi.colorado.edu/~vis/vis_files_2.4.html

        Pitfalls: Dont extract the vis and glu .tar.gz files using gui. Instead use the commands given below

```console
gzip -dc /tmp/glu-2.4.tar.gz | tar xf -
gzip -dc /tmp/vis-2.4.tar.gz | tar xf -
```
        Setting environment for VIS
```console
set VIS_LIBRARY_PATH=$cwd/share
```

    Installing vl2mv:
    ----------------

        Follow instructions in the README file in http://vlsi.colorado.edu/~vis/vis_files_2.4.html

        "make check" will fail since the vl2mv-2.4/examples folder is empty. Don't worry about that
