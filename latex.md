
### Highlight entries inside listing
[Ref](https://tex.stackexchange.com/questions/299401/bold-just-one-line-inside-of-lstlisting/299406#299406)

### Shrink table size

```console
\begin{frame}
  \begin{table}[h]
	\vspace{-0.4 cm}
	\caption{Likelihood values for two step filtering of waypoints \label{ll-mesi}}
	%\vspace{-0.45 cm}
	\begin{center}
	  %\begin{tabular}{|p{3cm}|p{0.7cm}|p{0.7cm}|p{2.15cm}|}
	  \resizebox{0.7\columnwidth}{!}{%
		\begin{tabular}{|l|l|l|l|}
		  \hline  
		  Guidance Hints ($H$)	& $ll$ at step-1 & $ll$ at step-2	& Selected/ rejected\\ 	\hline  
		  H(0)	&0.4891	& 0.3136	& Rejected in step-2\\ 	\hline  
		  H(1)	&0.4896	&0.3132	&Rejected in step-2\\ 	\hline  
		  H(2)	&0	&0.3145	&Rejected in step-2\\ 	\hline  
		  \textit{H(3)}	&\textit{0.4610}	&\textit{0}	&\textit{Selected}\\ 	\hline  
		  H(4)	&0.4896	&0.3132	&Rejected in step-2\\ 	\hline  
		  H(5)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(6)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(7)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(8)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(9)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(10)	&0	&NA	&Rejected in step-1\\ 	\hline  
		  H(11)	&0	&NA	&Rejected in step-1\\ 	\hline  
		\end{tabular}
	  }
	\end{center}                                                
	\vspace{-0.3cm}               
  \end{table}
\end{frame}
```

[Ref](https://tex.stackexchange.com/questions/10863/is-there-a-way-to-slightly-shrink-a-table-including-font-size-to-fit-within-th/10864)

### Include .tex images

```console
\begin{frame}
  \begin{figure}[h] 
	\centering
	\scalebox{.5}{\import{images/}{workFlow_no_tool_names.tex}} 
	\caption{Work flow}
	\label{figure_workflow}
  \end{figure}
\end{frame}
```

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

