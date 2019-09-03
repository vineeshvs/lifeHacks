#### Search for strings with special characters in vim

### Search for number of occurances of a string in a file

```console
:%s/pattern//ng
```

### Comment lines interactively
Commenting lines in matlab.
	
```console
	.,$s/\n/\r%/gc
```

### Open two files simultaneously
  With horizondally split windows
```console
    vim -o file1 file2
```
  With vertically split windows
```console
    vim -O file1 file2
```

### Copy and paste whole line
```console
  yy
  p
  P
```

### Case insensitive search
Use the \c escape sequence.
```console
  /\ccopyright
```

Eg: Searching for '\n'
```console
/\\n
```

* Go to the last line
```console
    G
```
* Go to the first line
```console
    gg
```
* Copy word under cursor starting from the current position of the cursor.
```console
 yw 
```

* Copy paste between two buffers
    Copy from fist file (use visual mode and 'y') then open your second file from within vim (:e /path/to/other/file) and paste it
  [Ref](https://stackoverflow.com/questions/4620672/copy-and-paste-content-from-one-file-to-another-file-in-vi)

* Do search and replace operation step-by-step from the current cursor line
```console
  :.,$s/wire/input/gc
```

* Searching multiple words in Vim editor
```console
  /search1\|search2
```
  Ref: http://stackoverflow.com/questions/704434/is-there-any-way-to-highlight-multiple-searches-in-gvim

* Changing the tab width to 6 spaces permanenlty
    Add the following to .vimrc (create one if not found in ~/)
```console
        filetype plugin indent on
        " show existing tab with 4 spaces width
        set tabstop=4
        " when indenting with '>', use 4 spaces width
        set shiftwidth=4
        " On pressing tab, insert 4 spaces
        set expandtab
```
    Ref: [http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim]

Indenting a block of codes in Vim

```console
    V j j >
```
  Ref: [http://stackoverflow.com/questions/235839/indent-multiple-lines-quickly-in-vi]

Indenting a block of code visually

  Select the block

```console
    V
```
  
  Intent one shiftwidth (as mentioned in .vimrc)
    
```console
    >
```
  
  Repeat the command to intent by one more shiftwidth (and repeat it if you want more)
    
```console
    .
```

* Paste as it is in vim
	* Do 
```console
  :set paste
```
	* Paste the text (Middle click or Shift+Ctrl+V)

* Mark in Vim
	* ma:	set mark a at current cursor location
	* 'a:	jump to line of mark a (first non-blank character in line) 
* Moving between two windows in vimdiff or vim -d
        Ctrl+w w also moves to the next window
