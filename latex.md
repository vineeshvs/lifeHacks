17-Jan-2017
-----------
* Hyperlink
	\href{http://www.ti.com/lit/ds/symlink/adc0808-n.pdf}{ADC0808 datasheet}

08/10/2015:
-----------

* Using .ps file
	* Use the following command to convert it to pdf (with proper bounding boxes)
		ps2pdf -dEPSCrop -dNOSAFER ex_circuit.ps
	* Do include as follows
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

* Getting the labels correctly
	* I had to do pdflatex, dvi -> ps, ps -> pdf and quick build (i think)

* ERROR: foo-eps-converted-to-pdf not found
	
	POSSIBLE SOLUTION:
	
	The important line of the .log file is:
	
	runsystem(epstopdf --outfile=foo-eps-converted-to.pdf foo.eps)...disabled.

	The conversion do not work, because the shell escape feature is not enabled. Probably you are using an older TeX distribution. TeX Live and MiKTeX have a the restricted shell escape feature enabled by default.

	On older systems (not too old, of course) the following option should work:

	pdflatex --shell-escape

	or (MiKTeX)

	pdflatex --enable-write18

* Installing minted.sty in linux
    * Download minted.sty and keep in ~/Downloads
    * sudo su
    * Copy it to a directory as given below
        mkdir usr/share/texmf/tex/latex/downloaded_packages/minted
        cp ~/Downloads/minted.sty /usr/share/texmf/tex/latex/downloaded_packages/minted
    * texhash
    * Retry it in Texmaker

