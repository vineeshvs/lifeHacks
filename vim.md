# GVIM

#### Hide Menu/toolbar
:set guioptions -=m 
:set guioptions -=T

#### Autcomplete

Cntrl + p/n

# VIM

## TODOs
https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters

#### Display or hide line numbers

    :set number
    :set nonumber

#### Delete rest of the word

    :dw

#### Auto read files open in Vim
Put the following in your .vimrc:

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime 

https://stackoverflow.com/questions/2157914/can-vim-monitor-realtime-changes-to-a-file

#### Regex for one or more occurrences
Use \+ instead of just +

[Ref](https://stackoverflow.com/questions/838979/unable-to-match-one-or-more-whitespaces-in-vim)

#### Reload all files open in a split winodow

    :windo e

[Ref](https://stackoverflow.com/questions/3770715/how-do-you-reload-all-vim-windows-at-once)

You can use the :edit command, without specifying a file name, to reload the current file. If you have made modifications to the file, you can use :edit! to force the reload of the current file (you will lose your modifications).

The command :edit can be abbreviated by :e. The force-edit can thus be done by :e!

In addition to manually refreshing the file with :edit, you can put into your ~/.vimrc

    :set autoread


[Ref](https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim)


#### Add comments (%) in a Matlab/ Octave script.

    :.,$s/\n/\r\%/gc


#### Using Vim scripts

* Create name_of_the_script.vim

An example

        :%s/S0/$S_{0}$/gc
        :%s/S1/$S_{1}$/gc
        :%s/S2/$S_{2}$/gc
        :%s/S3/$S_{3}$/gc
        :%s/S4/$S_{4}$/gc
        :%s/S5/$S_{5}$/gc
        :%s/S6/$S_{6}$/gc

* Open your file in Vim and run the script as follows
```console
:source <name_of_the_script.vim>
```

[Ref](https://stackoverflow.com/questions/3374179/run-vim-script-from-vim-commandline/8806874)

#### Search for strings with special characters in vim

#### Interactive find and replace inside all files in a directory it's sub-directory and so on.

```console
shopt -s globstar
vim -c 'set nomore' -c 'argdo %s/ats2019-oreon-subproperty-generator/ats2019-orion/gc' -c xa **/*.tcl
```

[Credits](https://stackoverflow.com/questions/55774223/interactive-find-and-replace-in-all-files-including-those-in-sub-directories-usi)

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
