#########################################################################################################
# Script: Statistical data analysis with functions
# Author : Esther Cros
# Date : 14 janvier 2025
# Objective: Example of organization, best practices and documentation
#########################################################################################################

# More details for code objective: .......


# Tip 1 : Concise but explanatory comments: Explain the purpose of a block of code, especially for important or complex steps.

# ===================================================
# ---- 1. Initialization ----
# ===================================================

# Tip 2 : Always comment on imported libraries, so that others know which dependencies are needed to make the code work.

# Loading the necessary libraries
library(ggplot2)  # For visualization
library(dplyr)    # For data manipulation
library(readr)    # To read CSV files

# Defining the environment
rm(list = ls())  # Cleans the workspace
set.seed(123)    # Fix a seed for reproducible results

# ===================================================
# ---- 2. Useful functions ----
# ===================================================

# Tip 3: If you're working with functions, it's a good idea to specify the function's role, 
# its inputs and outputs, and specify the type of each input and output.

# Tip 4 : Checking input types : To avoid errors, it is often useful to check that a function's inputs are of the expected type 
# (for example, by verifying that an argument is indeed a numerical vector).

#' Find out what's wrong with my function...

# Function: Calculate statistical summary
# Input: data (data.frame), group_col (group name), value_col (value name)
# Output: Statistical summary with mean and standard deviation
calculer_resume <- function(data, group_col, value_col) {
  # Check that columns exist
  if (!all(c(group_col, value_col) %in% colnames(data))) {
    stop("The specified columns are not in the data.frame.")
  }
  
  # Statistical summary calculation
  resume <- data %>%
    group_by(.data[[group_col]]) %>%
    summarise(
      moyenne = mean(.data[[value_col]], na.rm = TRUE),
      ecart_type = sd(.data[[value_col]], na.rm = TRUE),
      .groups = "drop"
    )
  
  return(resume)
}

#' Tip 5 : Never put variables, function names... in a language other than English. 
#' It's annoying if you don't speak Italian, French, Russian or Chinese .... 

# ===================================================
# ---- 3. Data loading ----
# ===================================================

# Tip 6 : When importing data, it's a good idea to add a comment explaining the source of the data and the import method. 
# In addition, each data cleansing step should be accompanied by a comment explaining why it is necessary.

# Tip 7 : Use explicit variable names and avoid abbreviations. 
# Comment on analysis steps so others know what each line of code is trying to accomplish.

data <- data.frame(
  group = rep(c("A", "B", "C"), each = 10),
  value = c(rnorm(10, mean = 5), rnorm(10, mean = 10), rnorm(10, mean = 15))
)

# ===================================================
# ---- 4. Exploration and analysis ----
# ===================================================

# Tip 8 : Comment on each element of the visualization. For example, if you change colors or chart types, explain why these choices are made.

# Using the function to calculate a statistical summary
resume <- calculer_resume(data, "group", "value")
print(resume)

# Data visualization
ggplot(data, aes(x = group, y = value)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Distribution of values by group",
    x = "Group",
    y = "Valie"
  )

# ===================================================
# ---- 5. Saving results ----
# ===================================================

# Save statistical summary
write_csv(resume, "resume_statistiques.csv")
cat("Statistical summary recorded under 'resume_statistiques.csv'\n")

# ===================================================
# ---- 6. End of script ----
# ===================================================

cat("Script successfully completed !\n")
