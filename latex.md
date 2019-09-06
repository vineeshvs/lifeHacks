### Including .dot files (graphs mostly) in Latex document
1. Convert to eps (See the example below)

```console
dot -Tps2 cone_count2_counters.dot -o cone_count2_counters.eps
```

2. Include the .eps in the document
```console
    \begin{figure}[htp]
    \begin{center}
      \includegraphics[width=0.9\textwidth]{myGraph}
      \caption{My Caption}
      \label{fig:myGraph}
    \end{center}
    \end{figure}
```
[Ref](http://www.davehofmann.de/including-dot-graphs-as-postscript-files-in-latex-documents/)

### Creating custom .dot files (You could draw good quality FSMs for publications using .dot files by converting them to .eps as mentioned above)
```console
    digraph  {
    "mesi_isc_basic_fifo.rst";
    "mesi_isc_basic_fifo.ptr_rd";
    "mesi_isc_basic_fifo.clk";
    "mesi_isc_basic_fifo.ptr_wr";
    "mesi_isc_basic_fifo.status_full_o";
    "mesi_isc_basic_fifo.fifo_depth";
    "mesi_isc_basic_fifo.fifo_depth_decrease";
    "mesi_isc_basic_fifo.rd_i";
    "mesi_isc_basic_fifo.wr_i";
    "mesi_isc_basic_fifo.fifo_depth_increase";
    "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.rst" -> "mesi_isc_basic_fifo.ptr_wr";
    "mesi_isc_basic_fifo.rst" -> "mesi_isc_basic_fifo.ptr_rd";
    "mesi_isc_basic_fifo.rst" -> "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.ptr_rd" -> "mesi_isc_basic_fifo.fifo_depth";
    "mesi_isc_basic_fifo.ptr_rd" -> "mesi_isc_basic_fifo.ptr_rd";
    "mesi_isc_basic_fifo.clk" -> "mesi_isc_basic_fifo.ptr_wr";
    "mesi_isc_basic_fifo.clk" -> "mesi_isc_basic_fifo.ptr_rd";
    "mesi_isc_basic_fifo.clk" -> "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.ptr_wr" -> "mesi_isc_basic_fifo.ptr_wr";
    "mesi_isc_basic_fifo.ptr_wr" -> "mesi_isc_basic_fifo.fifo_depth";
    "mesi_isc_basic_fifo.fifo_depth" -> "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.fifo_depth_decrease" -> "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.rd_i" -> "mesi_isc_basic_fifo.fifo_depth_decrease";
    "mesi_isc_basic_fifo.rd_i" -> "mesi_isc_basic_fifo.fifo_depth_increase";
    "mesi_isc_basic_fifo.rd_i" -> "mesi_isc_basic_fifo.ptr_rd";
    "mesi_isc_basic_fifo.wr_i" -> "mesi_isc_basic_fifo.ptr_wr";
    "mesi_isc_basic_fifo.wr_i" -> "mesi_isc_basic_fifo.fifo_depth_decrease";
    "mesi_isc_basic_fifo.wr_i" -> "mesi_isc_basic_fifo.fifo_depth_increase";
    "mesi_isc_basic_fifo.fifo_depth_increase" -> "mesi_isc_basic_fifo.status_full";
    "mesi_isc_basic_fifo.status_full" -> "mesi_isc_basic_fifo.status_full_o";
    "mesi_isc_basic_fifo.status_full" -> "mesi_isc_basic_fifo.status_full";
    }
```


### Installing the texlive full

```console
sudo apt install texlive-full
```
  [Read this before you do](https://tex.stackexchange.com/questions/134365/installation-of-texlive-full-on-ubuntu-12-04)


17-Jan-2017
-----------
* Hyperlink

```console
\href{http://www.ti.com/lit/ds/symlink/adc0808-n.pdf}{ADC0808 datasheet}
```

08/10/2015:
-----------

* Using .ps file
	* Use the following command to convert it to pdf (with proper bounding boxes)

```console
		ps2pdf -dEPSCrop -dNOSAFER ex_circuit.ps
```

	* Do include as follows
```console
		\begin{figure}[here]
		\centering
		%\psfrag{Vs}{$V_{S}$}
		%\psfrag{Voc(t)}{$V_{oc}(t)$}
		%\psfrag{R}{R}
		%\psfrag{1.8 kOhm}{1.8 k$\Omega$}
		\includegraphics[width=0.5\textwidth]{../images/ex_circuit.pdf}
		\	caption{Circuit diagram to observe Body Bias}
		\label{ckt_bodybias}
		\end{figure}
```

* Getting the labels correctly
	* I had to do pdflatex, dvi -> ps, ps -> pdf and quick build (i think)

* ERROR: foo-eps-converted-to-pdf not found
	
	POSSIBLE SOLUTION:
	
	The important line of the .log file is:
	
	runsystem(epstopdf --outfile=foo-eps-converted-to.pdf foo.eps)...disabled.

	The conversion do not work, because the shell escape feature is not enabled. Probably you are using an older TeX distribution. TeX Live and MiKTeX have a the restricted shell escape feature enabled by default.

	On older systems (not too old, of course) the following option should work:

```console
	pdflatex --shell-escape
```

	or (MiKTeX)

```console
	pdflatex --enable-write18
```

* Installing minted.sty in linux
    * Download minted.sty and keep in ~/Downloads
```console
    sudo su
```
    * Copy it to a directory as given below
```console
        mkdir usr/share/texmf/tex/latex/downloaded_packages/minted
        cp ~/Downloads/minted.sty /usr/share/texmf/tex/latex/downloaded_packages/minted
```
```console
    texhash
```
    * Retry it in Texmaker

