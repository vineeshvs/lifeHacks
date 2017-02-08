26/10/15:
---------

* CLASSES AND METHODS:
----------------------

* Possible conventions include capitalizing method names, prefixing data attribute names with a small unique string (perhaps just an underscore), or using verbs for methods and nouns for data attributes.

*  It is not necessary that the function definition is textually enclosed in the class definition: assigning a function object to a local variable in the class is also ok
# Function defined outside the class
def f1(self, x, y):
    return min(x, x+y)
class C:
    f = f1
    def g(self):
        return 'hello world'
    h = g

* Methods may call other methods by using method attributes of the self argument:
class Bag:
    def __init__(self):
        self.data = []
    def add(self, x):
        self.data.append(x)
    def addtwice(self, x):
        self.add(x)
        self.add(x)

* The syntax for a derived class definition looks like this:
class DerivedClassName(BaseClassName):
    <statement-1>
    .
    .
    .
    <statement-N>

* when the base class is defined in another module:
class DerivedClassName(modname.BaseClassName):

* A method of a base class that calls another method defined in the same base class may end up calling a method of a derived class that overrides it

* There is a simple way to call the base class method directly: just call BaseClassName.methodname(self, arguments).

* There is a convention that is followed by most Python code: a name prefixed with an underscore (e.g. _spam) should be treated as a non-public part of the API (whether it is a function, a method or a data member).

* Any identifier of the form __spam (at least two leading underscores, at most one trailing underscore) is textually replaced with _classname__spam, where classname is the current class name with leading underscore(s) stripped.

* Useful for Verilog parsing: 
A piece of Python code that expects a particular abstract data type can often be passed a class that emulates the methods of that data type instead. For instance, if you have a function that formats some data from a file object, you can define a class with methods read() and readline() that get the data from a string buffer instead, and pass it as an argument.

* PYTHON STYLE GUIDE:
---------------------
* https://www.python.org/dev/peps/pep-0008/

* COMMENTING STYLES:
-------------------
    * Use """function_details""" for adding comments for functions and use '''text_to_be_commented ''' for block comments which might include functions to avoid overlapping and possible errors

