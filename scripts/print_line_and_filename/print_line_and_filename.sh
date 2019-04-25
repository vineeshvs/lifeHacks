#!/bin/bash
#---------------------------------------------------------------
# Print a line (with specified line number) in a file with particular 
# extension, along with the name of the file.
# Search the current directory, sub-directory and sub-sub-directories etc.
# Author: vineeshvs
# Date: 21-Apr-2019
# Credits: 
# https://stackoverflow.com/questions/55774223/interactive-find-and-replace-in-all-files-including-those-in-sub-directories-usi
# Askok Sathyan, CADSL.
#---------------------------------------------------------------

#---------------------------------------------------------------
# How to use this script? 
#---------------------------------------------------------------
# chmod +x <name_of_this_file>
# ./<name_of_this_file> <extension> <line_number>
# Example: ./print_line_and_filename.sh txt 2
#---------------------------------------------------------------

#---------------------------------------------------------------
# Customize the code here
#---------------------------------------------------------------
extension=$1
line_number=$2
# '1': If you want to print the empty lines as well.
print_empty_lines=0
#---------------------------------------------------------------

if [ "$#" -ne 2 ]
then
  printf "Usage: \n./<name_of_this_file> <extension> <line_number>\nExample: ./print_line_and_filename.sh txt 2\n"
  exit 1
fi

shopt -s globstar

if [ "$print_empty_lines" -eq 1 ]
   # There should be a space after [ and before ].
then
    # Print the line always
    for filename in **/*.$extension; do
	printf ${filename}: 
	sed -n ${line_number}p $filename 
	echo
    done
else
    # Print the line only if it's not empty
    for filename in **/*.$extension; do
	if [[ $(sed -n ${line_number}p  $filename) ]]
	then
	    # Line is not blank
	    printf ${filename}: 
	    sed -n ${line_number}p $filename 
	    echo
	else
	    :
	    #echo "BLANK LINE" 
	fi
    done
fi
