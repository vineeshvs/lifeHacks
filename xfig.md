#### Facing font issues in Ubuntu 20.04?

Ref: https://askubuntu.com/questions/1287283/text-size-in-xfig-not-working-in-ubuntu-version-20-04

#### Disable snap to grid

Select 'ADD POINTS' button from the left side bottom options and select Point position and click on 'ANY' in the options.

http://www.verycomputer.com/18_b158f71ceef58469_1.htm

* Getting latex fonts in xfig figures

  * When you click on the text mode in xfig click on the "Text flags" tab. Three options appear. One of them is "Special flag". Change this option from "Normal" to "Special". 
  * File -> Export
    * Change 'Language' to 'Combined PDF/Latex (both parts)'
    * No other changes are necessary.
    * Click on 'Export'
  [Ref](http://www.cse.iitd.ernet.in/~bagchi/general/xfig-latex-fonts.html)

  Error:
 
   'Unknown graphics extension .pstex'

  Solution/ Workaround:

    Select 'Combined PDF/Latex (both parts)' instead of 'Combined PS/Latex (both parts)' and use the following to include the figure

    ```console
    \begin{figure}[htbp]
    \begin{center}
    \input{lec1-ring.pdf_t}
    \caption{Constructing the two sequences.}
    \label{lec1:fig:ring}
    \end{center}
    ```

* Glue objects

```console
g
```
  click on all the objects you want to glue.
  right mouse click.
