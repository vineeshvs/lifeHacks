Commonly used commands in Emacs.

#### Replace with newline character

[Ref](https://stackoverflow.com/questions/613022/how-to-replace-a-character-with-a-newline-in-emacs)

#### Change all letters in the selected region to upper-case

```console
C-x C-u
```

#### Change all letters in the selected region to lower-case

```console
C-x C-l
```

#### Move current buffer to a new window (called 'frames' in Emacs)

```console
C-x 5 2
```

[Ref](https://stackoverflow.com/questions/57304580/how-to-move-an-emacs-buffer-to-a-new-window/57313435#57313435)

#### Reload a file in the buffer. 

```console
M-x revert-buffer
```
[Ref](https://emacs.stackexchange.com/questions/169/how-do-i-reload-a-file-in-a-buffer)

#### Newline.


#### Split window horizondally

```console
C-x 2
```
	
#### Split window vertically

	C-x 3

#### Indent a region interactively

	# Select the region to be indented.
	C-x <TAB>
	# Use arrows to indent interactively.
	# Press enter when you are done with the required indentation.

#### Repeat the last operation
TODO

#### Search for a full-word

M-x isearch-forward-regexp RET \_<axi\_> RET

#### Save current buffer with another name (Equivalent to 'save as')

	C-x C-w

#### Search using regexp

Example showing the search for two strings DEBUG and ERROR

	M-x occur RET 
	DEBUG\|ERROR.

#### List all opened files in Emacs
	
	C-x C-b

#### Replacements with regexp in Emacs

* Ask permission to replace everytime

		query-replace-regexp

* Do replacements without asking the user everytime.

		replace-regexp

#### Indent left by four spaces

	C-u -4 C-x TAB
[Ref](https://stackoverflow.com/questions/2249955/emacs-shift-tab-to-left-shift-the-block/2252922)

#### Incremental search (search as you type)

	C-s
* Move to next item: C-s
* Move to previous item: C-r

#### Move between upper and lower buffers
C-x o

#### Move between left and right buffers
C-x <left or right arrow>

#### Disable/ re-enable (/Toggle) auto-indent
M-x electric-indent-mode

#### Legend
M: Escape

#### Comment region
M-x comment-region

#### Search and replace in emacs
```console
Alt+x query-replace
```

#### Markdown syntax highlighting in emacs
[Ref]{https://jblevins.org/projects/markdown-mode/)

#### Go to a line
M-g M-g

#### Indentation for a single line
C-i

#### Undo 
Ctrl + /

Hold down Alt, type 2 0 0, then press CTRL+x u.

This gives an argument of 200 to the operation you are going to perform next (e.g. undo), so it applies that operation 200 times.

[Ref](https://stackoverflow.com/questions/15228883/is-fast-repeated-undo-possible-in-emacs)
