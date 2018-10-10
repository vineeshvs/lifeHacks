* Getting latex fonts in xfig figures

  [Ref](http://www.cse.iitd.ernet.in/~bagchi/general/xfig-latex-fonts.html)

  Error:
 
   'Unknown graphics extension .pstex'

  Solution/ Workaround:

    Select 'Combined PDF/Latex (both parts)' instead of 'Combined PS/Latex (both parts)' and use the following to include the figure

    ```console
    \begin{figure}[htbp]
    \begin{center}
    \input{lec1-ring.pstex_t}
    \caption{Constructing the two sequences.}
    \label{lec1:fig:ring}
    \end{center}
    ```
