### Using GNU Debugger to track segmentation fault.

Compile the program with -g -O0 option.

```console
gcc -Wall -g -O0 insertion_sort.c -nostartfiles -lpython2.7 -o insertion_sort
```

[Ref 1](https://www.gnu.org/software/gcc/bugs/segfault.html)
[Ref 2](https://www.thegeekstuff.com/2010/03/debug-c-program-using-gdb/)

```console
break
run
n
n
n
<until you hit the breakpoint>
```

i b : Display all breakpoints.
d: Delete all breakpoints.
c: Run till next breakpoint.
n: Step to next line. 
