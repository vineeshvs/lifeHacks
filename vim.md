* Find the number of lines where a pattern is found
  :%s/<PATTERN_NAME>/gn

* Searching multiple words in Vim editor
  /search1\|search2
  Ref: http://stackoverflow.com/questions/704434/is-there-any-way-to-highlight-multiple-searches-in-gvim

* Changing the tab width to 6 spaces permanenlty
    Add the following to .vimrc (create one if not found in ~/)
        filetype plugin indent on
        " show existing tab with 4 spaces width
        set tabstop=4
        " when indenting with '>', use 4 spaces width
        set shiftwidth=4
        " On pressing tab, insert 4 spaces
        set expandtab
    Ref: [http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim]

Indenting a block of codes in Vim
		V j j >
    Ref: [http://stackoverflow.com/questions/235839/indent-multiple-lines-quickly-in-vi]

* Paste as it is in vim
	* Do :set paste
	* Paste the text (Middle click or Shift+Ctrl+V)

* Mark in Vim
	* ma:	set mark a at current cursor location
	* 'a:	jump to line of mark a (first non-blank character in line) 
* Moving between two windows in vimdiff or vim -d
        Ctrl+w w also moves to the next window
