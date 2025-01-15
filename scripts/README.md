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
- Le guide de style assidif de Hadley Wickham 
- R Conventions de codification de l'art par Henrik Bengtsson
- Style de codage des bioconducteurs
- Guide du style R de Google
- https://jef.works/R-style-guide/

## SCRIPTS

- Template_Script_R_1.R
 Template 1 : script R

- Template_Script_R_2.R
Template 2 : script R

- Template_Script_RMarkdown.Rmd
 Template 1 : script Rmarkdown
