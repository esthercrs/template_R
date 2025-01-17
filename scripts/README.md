# A good R encoding style

A coding style may vary according to personal preference, but to ensure mutual understanding and maintain consistency, common standards are essential. This guide summarizes some best practices widely adopted in the R community.
These rules are not rigid, but they provide a solid basis for structuring your code in a clear and professional way. Key elements to consider include :
- Comments to describe the file, its contents and copyright.
- Organization of unit tests in dedicated files, with explicit names (e.g. originalfilename_unittest.R).
- Clearly and legibly define functions.

By applying these recommendations, you'll make your code not only readable, but understandable to everyone. This guide gives you tips on naming, syntax, spacing and much more, to help you create elegant and functional R scripts.

## Notation and naming

### The names

- Avoid using duplicate variable and function names.
  
#### File names

- File names should be appropriate to their content, in lower case and end with .R
- To separate words within a file name, use capital letters and (_) if necessary.
```r
# Good
getData.R

# Acceptable
get_data.R
        
# Bad
foo.bar.r
89317240934735.r
```

- If files are executed in sequence, it is a good idea to prefix them with numbers.
```r
0_download.R
1_parse.R
2_explore.R
```
#### Variable names 

- Variable names should be in lower case. 
- Variable names = names
- Concise and meaningful names
- Avoid using “-” or “_”.

#### Function names 

- Function nouns = verbs
- Concise, meaningful nouns
- Avoid using “-” or “_”.

#### Class names
- Do not use . In their declaration
```r
# Good
pcaEmbedding  # variable
getPcaEmbedding <- function()  # function

# Acceptable
pca.embedding
getEmb <- function() 

# Bad
pca_embedding
get_pca_embedding <- function()
get.pca.embedding <- function() 

# Really bad
pe
gpe <- function()
foo-bar <- function()
```

## Syntax
- Use <-, not =, for assignment.
```r
# Good
x <- 5
# Bad
x = 5
```
- do not use “ ; ” :
```r
# Good 
x <- 23
y <- 12

# Bad
x = 23; y = 12
23 -> x
```

### Spacing
- place spaces around all binary operators (=, +, -, <-, etc.).
```r
# Good
average <- mean(feet / 12 + inches, na.rm = TRUE)

# Bad
average←mean(feet/12+inches,na.rm=TRUE)
```
The only exception is the “:”. In this case, there are no spaces around them.  

- Place a space before “(”, except in a function call.
```r
# Good
if (debug) do(x)
plot(x, y)

# Bad
if(debug)do(x)
plot (x, y)
```

- Put a space after a comma, not before.
- Opening braces: they must never stand alone on a line; they must be followed by a new line containing code.
- Closing braces: they must always stand alone on their own line, unless followed by an else.
- Code inside braces: always include code inside braces, do not write conditional statements (if, else) without braces, even if a line follows.

```r
# Good

if (y < 0 && debug) {
  message("Y is negative")
}

if (y == 0) {
  log(x)
} else {
  y ^ x
}

# Bad

if (y < 0 && debug)
message("Y is negative")

if (y == 0) {
  log(x)
} 
else {
  y ^ x
}
```
- More than one extra space is acceptable if it improves code alignment.


### Line lengths 

- Try to limit the code to 80 line characters (one printed page). If this is too short, consider encapsulating part of the work in a fonction
```r
# Good
someFunction(optionA = alpha,
             optionB = bravo,
             optionC = charlie,    
             optionD = delta)

# Acceptable
someFunction(optionA = alpha,
    optionB = bravo, optionC = charlie,    
    optionD = delta)

# Bad
someFunction(optionA = alpha, optionB = bravo, optionC = charlie, optionD = delta)
```

##  Organization

### Comments
- Comment your code. Each line of a comment should begin with the comment symbol and a single space: #. Comments should explain why, not what.
- Use -and =-commented lines to break down your file into easily readable chunks.
- Functions should contain a comment section immediately above the function. With a function definition line. List of arguments and their types with descriptions (perhaps noted Args). List of returns and their types with descriptions (perhaps noted returns).  
```r
 # Computes the sample covariance between two vectors.
 #
 # Args:
 #   x: One of two vectors whose sample covariance is to be calculated.
 #   y: The other vector. x and y must have the same length, greater than one,
 #      with no missing values.
 #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
 #
 # Returns:
 #   The sample covariance between x and y.
CalculateSampleCovariance <- function(x, y, verbose = TRUE) 
  n <- length(x)
  # General comment
  if (n <= 1 || n != length(y)) { # inline comment
    stop("Arguments x and y have invalid lengths: ",
         length(x), " and ", length(y), ".")
  }
  if (TRUE %in% is.na(x) || TRUE %in% is.na(y)) {
    stop(" Arguments x and y must not have missing values.")
  }
  covariance <- var(x, y)
  if (verbose)
    cat("Covariance = ", round(covariance, 4), ".\n", sep = "")
  return(covariance)
}
```

### Definition of functions 

- Function definitions must first list arguments without default values, followed by arguments with default values.

## Reference and resources 
- Hadley Wickham's guide to assiduous style 
- R Art coding conventions by Henrik Bengtsson
- Bioconductor coding style
- Google's R style guide

## SCRIPTS

- Template_Script_R_1.R
 Template 1 : script R

- Template_Script_R_2.R
Template 2 : script R

- Template_Script_RMarkdown.Rmd
 Template 1 : script Rmarkdown

==============================================================================================










==============================================================================================
==============================================================================================










==============================================================================================

# A good Python encoding style

After exploring good coding practices in R, this guide focuses on best practices in Python, which share many similarities but also have their own peculiarities. As with R, the aim is to promote code readability, consistency and maintainability, while respecting the conventions of the Python community.

The following rules are not strict, but they provide a solid basis for structuring clean, professional code. You'll find recommendations for organization, syntax and naming conventions that will enable you to write Python scripts that are readable and easy to understand for all developers.

## Code provision

### Spacing

-	Use 4 spaces per indentation level.
- Align lines of code vertically within their loops.
When returning to the line after a parenthesis, use 4 spaces, otherwise indent the next line at the parenthesis level.

```Python
# Correct:

# Aligned with opening delimiter.
foo = long_function_name(var_one, var_two,
                         var_three, var_four)

# Add 4 spaces (an extra level of indentation) to distinguish arguments from the rest.
def long_function_name(
        var_one, var_two, var_three,
        var_four):
    print(var_one)

# Hanging indents should add a level.
foo = long_function_name(
    var_one, var_two,
    var_three, var_four)
# Wrong:

# Arguments on first line forbidden when not using vertical alignment.
foo = long_function_name(var_one, var_two,
    var_three, var_four)

# Further indentation required as indentation is not distinguishable.
def long_function_name(
    var_one, var_two, var_three,
    var_four):
    print(var_one)
```


## Tabs or spaces

### Maximum line length 

-	Limit all lines to a maximum of 79 characters. 
- Implicit line continuation with parentheses, brackets and curly braces: allows long lines to be split.
```Python
total = (
    10 + 20 + 30 + 40
)
```
-	Alternatively, use the backslash: less recommended but still acceptable, for example in with statements with multiple files.
```Python
with open('/path/to/some/file/you/want/to/read') as file_1, \
     open('/path/to/some/file/being/written', 'w') as file_2:
     file_2.write(file_1.read())
```

### Line feed before or after binary operators

-	Skip one line before a binary operator so as not to require too much effort on the part of the proofreader.
```Python
# Wrong:
# operators sit far away from their operands
income = (gross_wages +
          taxable_interest +
          (dividends - qualified_dividends) -
          ira_deduction -
          student_loan_interest)

# Correct:
# easy to match operators with operands
income = (gross_wages
	          + taxable_interest
	          + (dividends - qualified_dividends)
	          - ira_deduction
	          - student_loan_interest)
```

### Empty lines
- Surround top-level function and class definitions with two blank lines.
- Method declarations within a class are surrounded by a single blank line.
- Additional blank lines can be used to separate groups of related functions.
- Use blank lines sparingly in functions, to indicate logical sections.

### Source file coding
- Code in the main Python distribution must always use UTF-8 and have no encoding declarations.
- Non-UTF-8 encodings are reserved for testing.
- Use non-ASCII characters sparingly, to designate places and human names for example.
- ASCII identifiers only: All identifiers in the standard Python library must be in ASCII, i.e. without special or accented characters.
- Preference for English: Identifiers should use English, except where technical abbreviations or specific terms are required.
```Python
Bad : def calculer_somme(a, b): return a + b
Good : def calculate_sum(a, b): return a + b
```

### Import
-	Imports must be on separate lines
```Python
# Correct:
import os
import sys
# Wrong:
import sys, os
# Correct:
from subprocess import Popen, PIPE
```

-	Imports are always at the top of the file. Just after comments and module docstrings, and before global variables and module constants.
1.	They should appear as follows: 
Standard library imports.
2.	Imports from linked third parties.
3.	Imports specific to local applications/libraries.
Remember to put a blank line between each section.
- Absolute imports are recommended
- When importing a class from a module containing a class, it is generally correct to write :
```Python
from myclass import MyClass
from foo.bar.yourclass import YourClass
```

-	Generic imports ( ) should be avoided, as they do not make it clear which names are present in the namespace.
```Python
from <module> import *
```

### Dunder module level names
-	Module-level “dunders” (i.e. names with two underscores at the beginning and two at the end) such as __all__, __author__, __version__, etc. must be placed after the module documentation string but before any import instructions, with the exception of imports.
```Python
"""This is the example module.

This module does stuff.
"""

from __future__ import barry_as_FLUFL

__all__ = ['a', 'b', 'c']
__version__ = '0.1'
__author__ = 'Cardinal Biggles'

import os
import sys
```

## Chain Quotes

In Python, single-quoted strings and double-quoted strings are identical. However, when a string contains either single or double quotation marks, use the other to avoid backslashes in the string. 

## Spaces in expressions and instructions

### Black beetles

-	Avoid superfluous spaces in the following situations:
  o immediately inside parentheses, brackets or braces 
  o between an ending comma and the next closing parenthesis
  o Immediately before a comma, semicolon or colon
  o For colons, apply the same spacing on both sides
  o Immediately before the open parenthesis that starts the argument list of a function call
  o Immediately before the open parenthesis that starts an indexing or trimming operation
  o More than one space around an assignment operator (or other) to align it with another operator.
- Avoid adding spaces at the end of lines
- Surround binary operators with a single space on each side.
- If operators with different priorities are used, remember to add spaces around the operators with the lowest priority(s).
- Function annotations should use the normal colon rules and always have spaces around the ->arrow if present.
```Python
# Correct:
def munge(input: AnyStr): ...
def munge() -> PosInt: ...
# Wrong:
def munge(input:AnyStr): ...
def munge()->PosInt: ...
```
-	Do not use spaces around the =sign when it is used to indicate a keyword argument or when it is used to indicate a default value for an unannotated function parameter.
```Python
# Correct:
def complex(real, imag=0.0):
    return magic(r=real, i=imag)
# Wrong:
def complex(real, imag = 0.0):
    return magic(r = real, i = imag)
```
-	However, when combining an argument annotation with a default value, use spaces around the = sign.
```Python
# Correct:
def munge(sep: AnyStr = None): ...
def munge(input: AnyStr, sep: AnyStr = None, limit=1000): ...
# Wrong:
def munge(input: AnyStr=None): ...
def munge(input: AnyStr, limit = 1000): ...
```
-	Although it's sometimes acceptable to place an if/for/while with a small body on the same line, never do so for multi-clause instructions.

## When to use trailing commas
-	End commas are generally optional, except that they are mandatory when creating a tuple from a single element.
```Python
# Correct:
FILES = ('setup.cfg',)
# Wrong:
FILES = 'setup.cfg',
```
-	Where trailing commas are redundant, they are often useful when a version control system is used, where a list of values, arguments or imported elements needs to be extended over time. The model is to place each value (etc.) on a separate line, always adding a trailing comma, and to add the parenthesis/bracket/closing brace on the next line.

```Python
# Correct:
FILES = [
    'setup.cfg',
    'tox.ini',
    ]
initialize(FILES,
           error=True,
           )
# Wrong:
FILES = ['setup.cfg', 'tox.ini',]
initialize(FILES, error=True,)
```

## Comments
- Comments must be complete sentences. With the first word capitalized
- Block comments generally consist of one or more paragraphs of complete sentences, with each sentence ending in a period.
- You should use one or two spaces after a period in multi-sentence comments, except after the last sentence.
- Write in English.
Block comments
- Indent at the same level.
- Starts with a #.

### Online comments
- Use sparingly
- Separate the comment from the instruction by at least two spaces.
- Start with # followed by a space.
- Never comment on evidence unless you need to explain why.

### "docstrings” documentation chain
- Write docstrings for all public modules, functions, classes and methods.
- It's not necessary for non-public methods, but have a comment anyway.
- Use triple quotation marks to enclose a docstring, even for a single line (facilitates later extension).
- Use double triple quotes for consistency (“”“ or r”“” for raw strings).
- Docstring on one line :
```Python
def kos_root():
    """Return the pathname of the KOS root directory."""
```
-	Multi-line Docstring: Contains a summary line followed by a detailed description.
```Python
def complex(real=0.0, imag=0.0): 
"""Form a complex number. 

Keyword arguments: 
real -- the real part (default 0.0) 
imag -- the imaginary part (default 0.0)
 """
```

-	Document modules, functions and classes
  - Module: should list classes, functions, exceptions, etc., with summaries.
  - Function/Method: must describe its behavior, arguments, return values, exceptions thrown, side effects, etc.
  - Class: should summarize its behavior, list public methods and instance variables.
  - Subclasses: mention the differences with the parent class, using “override” or “extend”.
- The first line of the docstring can be indented from its original location.
- No blank line before or after a single-line docstring
- The summary line should be concise, end with a period, and not simply repeat the function signature.
- Docstrings must always be written in an imperative style (e.g. “Return the value”, “Do X”).
- SOURCE : PEP257

## Naming convention

### Variables
- Never use the characters “l” (lowercase el), “O” (uppercase oh) or “I” (uppercase eye) as single-character variable names - they're hard to distinguish from 1, 0, L, l...
- Type variable names should normally be in uppercase, with short names preferred: T, AnyStr, Num.
- It is recommended to add _co or _contra suffixes to variables used to declare covariant or contra-varying behavior accordingly:

### Modules
- Module names should be short and entirely in lower case. Underscores can be used in module names if they improve readability.

### Packages
- Module names should be short and entirely in lower case. Underscores may be used in module names if they improve legibility.

### Classes
- Class names should normally use the CapWords convention (two words combined).

### Exceptions : 
- For exception names, specify “Error”.

### Functions :
- Function names should be in lower case, with words separated by underscores if necessary.

### Function and method arguments: 
- If the name of a function argument conflicts with a reserved keyword, it is generally preferable to add a single underscore at the end rather than use an abbreviation or misspelling. Thus class_is better than clss. 
- Always use self as the first argument of instance methods
- Always use cls as the first argument of class methods.

### Instance method and variable names :
- Use function naming rules: lower case with words separated by underscores if necessary to improve readability.
- Use a leading underscore only for non-public methods and instance variables.
- To avoid naming conflicts with subclasses, use two underscores at the beginning to invoke Python's name modification rules.

### Constants : 
- Constants are usually defined at module level and written in uppercase letters with underscores separating the words. Examples include MAX_OVERFLOWand TOTAL.

### Designing for heritage :
- Always decide whether a class's methods and instance variables should be public or non-public. If in doubt, choose “non-public”; it's easier to make them public later than to make a public attribute non-public.
- Public attributes = attributes used by the public
- Non-public attributes = attributes not intended for use by third parties
- Other rules for another category of attributes: attributes that are part of the “subclass API”. see PEP8

## General programming recommendations: 
- Comparisons with singletons such as None should always be performed with is or is not , never with the equality operators.
- Use the is not operator rather than not ... is . Although the two expressions are functionally identical, the former is more readable and preferred.
- When implementing command operations with rich comparisons, it's preferable to implement all six operations ( __eq__, __ne__, __lt__, __le__, __gt__, __ge__) rather than relying on other code to exercise only a particular comparison.
- Always use a def statement instead of an assignment statement that links a lambda expression directly to an identifier:
```Python
# Correct:
def f(x): return 2*x
# Wrong:
f = lambda x: 2*x
```
- Use Exception, not BaseException: BaseException is the most general base class for all exceptions in Python. However, it's advisable not to create new exceptions that inherit directly from BaseException, except in very specific cases. Most exceptions should instead inherit from Exception, which is more specific.
- Prefer specific exceptions: Avoid unspecified except:. Instead, capture specific exceptions, such as except ImportError:.
- In addition, for all try/except clauses, limit the try clause to the absolute minimum of code required. This avoids hiding bugs.
```Python
# Correct:
try:
    value = collection[key]
except KeyError:
    return key_not_found(key)
else:
    return handle_value(value)
# Wrong:
try:
    # Too broad!
    return handle_value(collection[key])
except KeyError:
    # Will also catch KeyError raised by handle_value()
    return key_not_found(key)
```
- Context managers must be invoked via separate functions or methods whenever they do anything other than acquire and release resources:
```Python
# Correct:
with conn.begin_transaction():
    do_stuff_in_transaction(conn)
# Wrong:
with conn:
    do_stuff_in_transaction(conn)
```
- Be consistent in your return instructions. Either all the return statements of a function must return an expression, or none of them must. An explicit return instruction must be present at the end of the function :return None
```Python
# Correct:

def foo(x):
    if x >= 0:
        return math.sqrt(x)
    else:
        return None

def bar(x):
    if x < 0:
        return None
    return math.sqrt(x)
# Wrong:

def foo(x):
    if x >= 0:
        return math.sqrt(x)

def bar(x):
    if x < 0:
        return
    return math.sqrt(x)
```
- Use ''.startswith()and ''.endswith()instead of string splitting to check prefixes or suffixes.
```Python
# Correct:
if foo.startswith('bar'):
# Wrong:
if foo[:3] == 'bar':
```Python
- Object type comparisons should always use isinstance() instead of directly comparing types:
```Python
-	# Correct:
-	if isinstance(obj, int):
-	# Wrong:
if type(obj) is type(1):
```
- For sequences (strings, lists, tuples), use the fact that empty sequences are false:
```Python
# Correct:
if not seq:
if seq:
# Wrong:
if len(seq):
if not len(seq):
```Python
- Do not compare Boolean values to True or False using== :
```Python
# Correct:
if greeting:
# Wrong:
if greeting == True:
Pire:
# Wrong:
if greeting is True:
```
- Using a return in finally can be confusing, as it prevents errors from manifesting themselves correctly. So don't do it.

## Function annotation: 

- The argument and return type are declared in the annotations :
-	```Python
def greeting(name: str) -> str:
    return 'Hello ' + name
```
- It is recommended, but not mandatory, that verified functions have annotations for all arguments and return type. For a verified function, the default annotation for arguments and return type is Any. 
- Type aliases are defined by simple variable assignments:
```Python
Url = str

def retry(url: Url, retry_count: int) -> None: ...
```Python
- Type aliases can be as complex as type indications in annotations: anything that is acceptable as a type indication is acceptable in a type alias :
```Python
from typing import TypeVar, Iterable, Tuple

T = TypeVar('T', int, float, complex)
Vector = Iterable[Tuple[T, T]]

def inproduct(v: Vector[T]) -> T:
    return sum(x*y for x, y in v)
def dilate(v: Vector[T], scale: T) -> Vector[T]:
    return ((x * scale, y * scale) for x, y in v)
vec = []  # type: Vector[float]
```

## Assigning Expressions : Walrus ( :=) 
- The := operator lets you assign a value to a variable in an expression. Allows you to assign a value to a variable while using that value immediately in expressions such as list comprehensions or loops. For example:
```Python
	if (match := re.match(data)) is not None:
    		print("Match trouvé!")
```
Cannot be used in certain situations such as function arguments with keywords, function default values, or in type annotations.
- Cannot be used unparenthesized in certain complex expressions, to avoid confusion:
```Python
y := f(x) # INVALID (y := f(x)) # Valide
```

## List comprehensions:
- Captures an assignment expression in a list comprehension.

## Match Case
- The match evaluates a value (subject) and compares it with patterns to check its structure and link variables. If a match is found, the case block executes. Otherwise, it moves on to the next block.
- Use * to capture remaining elements in a list. The _ (wildcard) captures everything without binding variables.
- You can combine patterns with | to match several alternatives, and use ace to capture a sub-pattern.
- Conditions (if) can be added after the pattern to refine filtering.

## Sources
- PEP8
- PEP 484
- PEP 572
