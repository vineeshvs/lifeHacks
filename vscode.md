#### Bug: Cannot find root file 
**Fix** (Copied from https://github.com/James-Yu/LaTeX-Workshop/issues/776#issuecomment-421309521)

* Open the project folder with VS Code (make sure, that your root file is in some subdirectory of this folder)
* Open the .tex file from which you want to compile the document
* Press F1 (or whatever hotkey you have assigned to the "Show All Commands"-command
* Enter "root magic" - this should find the command "latex-workshop.addtexroot" (full name: Insert %!TeX root magic command) and pick the command.
* A list of .tex files in the projects should open - start typing the name of your desired root file (main.tex) and press enter. This inserts a correctly formatted root-comment and removes incorrectly formatted/old root-comments (if if recognizes them)
Save the file and compile.

#### vscode-fileheader
My settings
""" \n * @Title: \n * @Author: {author}  \n * @Date: {createTime}  \n * @Last Modified by:   {lastModifiedBy}  \n * @Last Modified time: {updateTime} \n * @Comments:  \n * @TODO: \n"""\n\n

#### Open recent files

Cntrl + R

#### Search for 'newline' characters
* Ctrl+F (enabling regex mode by clicking '.*' in 'Find' window)
* Search for '\n'.