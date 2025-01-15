# Un bon style d’encodage R

Un style de codage peut varier selon les préférences personnelles, mais pour garantir une compréhension mutuelle et maintenir une homogénéité, des standards communs sont essentiels. Ce guide résume quelques bonnes pratiques largement adoptées dans la communauté R.
Ces règles ne sont pas rigides, mais elles offrent une base solide pour structurer votre code de manière claire et professionnelle. Parmi les éléments clés à considérer :
    • Commentaires pour décrire le fichier, son contenu et ses droits d'auteur.
    • Organisation des tests unitaires dans des fichiers dédiés, avec des noms explicites (ex. originalfilename_unittest.R).
    • Définition claire et lisible des fonctions.
En appliquant ces recommandations, vous rendrez votre code non seulement lisible, mais également compréhensible par tous. Ce guide vous propose des astuces pour le nommage, la syntaxe, l’espacement et bien plus, afin de créer des scripts R à la fois élégants et fonctionnels.

## Notation et nommage :

### Les noms : 

- Eviter d’utiliser des noms de variables et de fonctions en double.
  
#### Noms de fichiers:

- Les noms de fichiers doivent être en rapport avec leur contenu, en minuscule et se terminer par .R
- Pour séparer des mots a l’interieur d’un nom de fichier utiliser des majuscules et éventuellement des (_).
'''
# Good
getData.R

# Acceptable
get_data.R
        
# Bad
foo.bar.r
89317240934735.r
'''

- Si les fichiers sont exécutés en séquences il est bien de les préfixer avec des nombres :
'''
0_download.R
1_parse.R
2_explore.R
'''
#### Noms de variables : 

- Noms des variables devraient être en minuscule. 
- Nom de variables = noms
- Noms concis et significatifs
-  Eviter d’utiliser le « - »  ou « _ »

#### Noms de fonctions : 
- Noms de fonctions = verbes
- Noms concis et significatifs
- Eviter d’utiliser le « - »  ou « _ »

#### Noms de classe : 
- Ne pas utiliser de . Dans leur déclaration
'''
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
'''

## Syntaxe : 
- Utilisation <-, non =, pour l'affectation.
'''
# Good
x <- 5
# Bad
x = 5
'''
- ne pas utiliser « ; » :
'''
# Good 
x <- 23
y <- 12

# Bad
x = 23; y = 12
23 -> x
'''

### Espacement : 
- placer des espaces autour de tous les opérateurs binaires (=, +, -, <-, etc.).
'''
# Good
average <- mean(feet / 12 + inches, na.rm = TRUE)

# Bad
average←mean(feet/12+inches,na.rm=TRUE)
La seule exception concerne les « : ». Dans ce cas aucun espace autour d’eux. 
'''

- Placer un espace devant « ( », sauf dans un appel de fonction.
'''
# Good
if (debug) do(x)
plot(x, y)

# Bad
if(debug)do(x)
plot (x, y)
'''

- Mettre un espace après une virgule, pas avant.
- Accolades d’ouverture : elles ne doivent jamais être seules sur une lignes, elles doivent être suivies d’une nouvelle ligne contenant du code.
- Accolades de fermeture : elles doivent toujours être seules sur leur propre lignes, sauf si elles sont suivi d’un else.
- Code a l’intérieur des accolades : toujours inclure du code dans les accolades, ne pas écrire des instructions conditionelles (if, else) sans accolades, même si une ligne suit.

'''
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
'''
- Plus d’un espace supplémentaire est acceptable s’il améliore l’alignement du code.


### Longueurs de lignes : 

- S’efforcer de limiter le code a 80 caractères de ligne  (une page imprimé). Si cela est trop court, pensez en encapsuler une partie du travail dans une fonction
'''
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
'''

## Organisation : 

### Observations
- Commentez votre code. Chaque ligne d'un commentaire doit commencer par le symbole du commentaire et un seul espace: #. Les commentaires devraient expliquer pourquoi, et non le quoi.
- Utiliser les lignes commentées de -et = afin décomposer votre fichier en morceaux facilement lisibles.
- Les fonctions doivent contenir une section des commentaires immédiatement au dessus de la fonction. Avec une ligne de définition de fonction. Liste des arguments et de leurs types avec descriptions (peut-être noté Args). Listes des retours et de leurs types avec descriptions (peut-être notés returns).  
'''
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
'''

### Définition des fonctions 

- Les définitions de fonctions doivent d’abord énumérer les arguments sans défault valeurs, suivi par celle avec des valeurs par default


## Référence et ressources : 
- Le guide de style assidif de Hadley Wickham 
- R Conventions de codification de l'art par Henrik Bengtsson
- Style de codage des bioconducteurs
- Guide du style R de Google
- https://jef.works/R-style-guide/








# README SCRIPT

## Template_Script_R_1.R
 Template 1 : script R

## Template_Script_R_2.R
Template 2 : script R

## Template_Script_RMarkdown.Rmd
 Template 1 : script Rmarkdown
