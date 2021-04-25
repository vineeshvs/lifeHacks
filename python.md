### Install python 2 regex in Ubuntu20.04

        sudo pip2 install regex
        # Check if installed
        pip2 list | grep "regex"

### Check the version of a Python package.

    pip2 freeze | grep <package_name>

For example,

    pip2 freeze | grep matplotlib
    pip2 freeze | grep networkx

### Installing Python packages in user account without root privileges
* For Python 2
pip install --user numpy matplotlib
* For Python 3
pip3 install --user numpy matplotlib
* There is some issue with pip3.8. The following command fails.
pip3 install --user numpy matplotlib

[Ref](https://stackoverflow.com/questions/7143077/installing-pip-packages-to-home-folder/7143496#7143496)

#### Installation using 'pip3' and 'python3 -m pip' are the same
Meaning, the following two commands are equivalent

    sudo python3 -m pip install pyverilog

    sudo pip3 install pyverilog

[Reference](https://stackoverflow.com/questions/41307101/difference-between-pip3-and-python3-m-pip)

### Run a local python script in a remote machine

```console
	ssh username@xxx.xxx.xxx.xxx python < test_python_ssh.py -
```

Example 
```console
	ssh vineeshvs@10.107.90.44 python < filter_wp.py -
```

### iPython: "ImportError: No module named seaborn"

Solution: 

```console
	sudo python3 -m pip install seaborn
```

### Pip error while opening Juypter-notebook
#### Error
AttributeError: '_NamespacePath' object has no attribute 'sort'
#### Solution

```console
	sudo python3 -m pip install --upgrade pip
	sudo python3 -m pip install --upgrade setuptools
```

[Ref](https://github.com/googleapis/google-cloud-python/issues/2990)

### Installation of pymc3

```console
	sudo python3 -m pip install pymc3
```

#### Update pymc3 with the latest development version

```console
	sudo python3 -m pip install --upgrade git+https://github.com/pymc-devs/pymc3
```
	
[Reason](https://discourse.pymc.io/t/specifying-the-number-of-chains-chains-vs-njobs/595/4)

### Error: No module named pip
The error is for python 3.
##### Solution

```console
	curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
```

[Ref](https://stackoverflow.com/questions/49478573/pip3-install-not-working-no-module-named-pip-vendor-pkg-resources)

### Removing a package which was installed using distutils, and reinstalling the latest one 
Example 1: scikit-learn

#### Uninstall old one

```console
	cd /usr/local/lib/python3.5/dist-packages
	sudo rm -rf sklearn-0.0.dist-info/
	cd /usr/lib/python3/dist-packages
	rm -rf scikit_learn-0.17.egg-info
```
	
[Ref](https://stackoverflow.com/questions/402359/how-do-you-uninstall-a-python-package-that-was-installed-using-distutils)

#### Reinstall new ones

```console
	sudo python3 -m pip install scikit-learn
```

##### Possible error

```console
	pip3 install not working - No module named 'pip._vendor.pkg_resources'
```

##### Solution
	
```console
	curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
```

[Ref](https://stackoverflow.com/questions/49478573/pip3-install-not-working-no-module-named-pip-vendor-pkg-resources)

Example2: scipy

```console
	cd /usr/lib/python3/dist-packages/
	rm -rc scipy*
	sudo python3 -m pip install scipy
```

### List the current active Jupyter-notebook files
#### Method 1

```console
	pgrep -a jupyter
	9354 /usr/bin/python3 /home/vineesh/.local/bin/jupyter-notebook bayesian_linear_regression.ipynb

	jupyter-notebook list
```

* Use the active port numbers from the result of above command to close each notebooks. Examples below

```console
		jupyter notebook stop 8888
		jupyter notebook stop 8890
		jupyter notebook stop 8889
```

### Changing the version of Python used by jupyter-notebook
Why? Sometimes you install packages in Python3 and Juypter-notebook will be using Python2. Hence it will keep showing the error of type "unable to import module xxx"

* Find out the location of Juypter-notebook script
```console
which jupyter-notebook 
/home/vineesh/.local/bin/jupyter-notebook
```

* If you want juypter-notebook to use Python 3, open the above file,
```console
	vim /home/vineesh/.local/bin/jupyter-notebook
```
  and edit the first line to the following,

```console
    #!/usr/bin/python3
```

Afterwards, if you find a module misssing error, install it (for Python3) using

```console
	sudo python3 -m pip install <name_of_the_module>
```

If you don't have Python3 pip, install it using the command in Ubuntu terminal.

```console
	sudo apt-get install python3-pip
```

### Installing packages in Pyton 3

Example 1: 

```console
python3 -m pip install matplotlib
```

Note: *pip install <software_name>* gives some error related to main.

Example 2:

* Error

```console
pip install seaborn
Traceback (most recent call last):
  File "/usr/bin/pip", line 9, in <module>
    from pip import main
ImportError: cannot import name main
```

* Solution
```console
python --version
```


Python 2.7.12

```console
python2 -m pip install seaborn
```
* Use sudo if you get permission errors. Or use --user to install for the user.

### CLASSES AND METHODS:

* Possible conventions include capitalizing method names, prefixing data attribute names with a small unique string (perhaps just an underscore), or using verbs for methods and nouns for data attributes.

*  It is not necessary that the function definition is textually enclosed in the class definition: assigning a function object to a local variable in the class is also ok
#### Function defined outside the class
```python
def f1(self, x, y):
    return min(x, x+y)
class C:
    f = f1
    def g(self):
        return 'hello world'
    h = g
```

* Methods may call other methods by using method attributes of the self argument:

```python
class Bag:
    def __init__(self):
        self.data = []
    def add(self, x):
        self.data.append(x)
    def addtwice(self, x):
        self.add(x)
        self.add(x)
```

* The syntax for a derived class definition looks like this:

```python
class DerivedClassName(BaseClassName):
    <statement-1>
    .
    .
    .
    <statement-N>
```

* when the base class is defined in another module:
class DerivedClassName(modname.BaseClassName):

* A method of a base class that calls another method defined in the same base class may end up calling a method of a derived class that overrides it

* There is a simple way to call the base class method directly: just call BaseClassName.methodname(self, arguments).

* There is a convention that is followed by most Python code: a name prefixed with an underscore (e.g. _spam) should be treated as a non-public part of the API (whether it is a function, a method or a data member).

* Any identifier of the form __spam (at least two leading underscores, at most one trailing underscore) is textually replaced with _classname__spam, where classname is the current class name with leading underscore(s) stripped.

* Useful for Verilog parsing: 
A piece of Python code that expects a particular abstract data type can often be passed a class that emulates the methods of that data type instead. For instance, if you have a function that formats some data from a file object, you can define a class with methods read() and readline() that get the data from a string buffer instead, and pass it as an argument.

### PYTHON STYLE GUIDE:
* https://www.python.org/dev/peps/pep-0008/

### COMMENTING STYLES:
* Use """function_details""" for adding comments for functions and use '''text_to_be_commented ''' for block comments which might include functions to avoid overlapping and possible errors

