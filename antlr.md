How to write ANTLR grammar:
---------------------------

* Writing Verilog grammar for the output of VIS, the counter example
	? : either zero or one
	+ : One or more
	* : Zero or more

	Wildcard characters: 
		'.' : All characters
		~c : every character but c

* [How to modify the listener and visitor files generated by antlr script](https://raw.githubusercontent.com/antlr/antlr4/master/doc/python]-target.md)

## FAQ
*  Error

    Error
        
        Traceback (most recent call last):
        File "parse_verilog.py", line 30, in <module>
            from antlr4 import *
        ImportError: No module named antlr4
       
    Solution

        Re-installed Antlr from Antlr.org.
        Reason for error is unknown

* Error

    Error 

        ANTLR runtime and generated code versions disagree: 4.7.1!=4.9
        ANTLR runtime and generated code versions disagree: 4.7.1!=4.9

    Solution

        None

    Additional info

        192 # Antlr4 paths (as mentioned in https://www.antlr.org/)
        193 # Old
        194 export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
        195 alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
        196 alias grun='java org.antlr.v4.gui.TestRig'
        197 # New (Commented due to the following error)
        198 #  ANTLR runtime and generated code versions disagree: 4.7.1!=4.9
        199 #  ANTLR runtime and generated code versions disagree: 4.7.1!=4.9
        200 # export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
        201 # alias antlr4='java -jar /usr/local/lib/antlr-4.9-complete.jar'
        202 # alias grun='java org.antlr.v4.gui.TestRig'
