# ===================================================
# Script: Statistical data analysis with functions
# Author : Esther Cros
# Date : 14 janvier 2025
# Objective: Example of organization, best practices and documentation
# ===================================================

# More details for code objective: .......


# Tip 1 : Concise but explanatory comments: Explain the purpose of a block of code, especially for important or complex steps.

# ---- 1. Initialization ----

# Tip 2 : Always comment on imported libraries, so that others know which dependencies are needed to make the code work.

# Loading the necessary libraries
library(ggplot2)  # For visualization
library(dplyr)    # For data manipulation
library(readr)    # To read CSV files

# Defining the environment
rm(list = ls())  # Cleans the workspace
set.seed(123)    # Fix a seed for reproducible results

# ---- 2. Useful functions ----

# Tip 3: If you're working with functions, it's a good idea to specify the function's role, 
# its inputs and outputs, and specify the type of each input and output.
# It's not always necessary to comment so much on functions. But for complex ones, it's always easier if you want to go back over the code after you've done it.

# Tip 4 : Checking input types : To avoid errors, it is often useful to check that a function's inputs are of the expected type 
# (for example, by verifying that an argument is indeed a numerical vector).

#' Find out what's wrong with my function...

# Function: calculer_resume
# Description: Calculates the mean and standard deviation of a specified numeric column, grouped by another column in a data frame.
#
# Inputs:
#   - data (data.frame): The input data frame containing the data to be summarized.
#   - group_col (character): A string specifying the name of the column to group the data by. 
#                            Must match a column name in the input `data`.
#   - value_col (character): A string specifying the name of the numeric column for which the statistical summary is calculated. 
#                            Must match a column name in the input `data`.
#
# Output:
#   - (data.frame): A data frame with the following structure:
#       - The grouping column (`group_col`) as the first column.
#       - `moyenne` (numeric): The mean of the specified value column for each group.
#       - `ecart_type` (numeric): The standard deviation of the specified value column for each group.
#
# Notes:
#   - Missing values (`NA`) in the value column are ignored during calculations.
#   - If either `group_col` or `value_col` does not exist in the input data frame, the function stops and raises an error.
#   - The returned data frame contains one row per group defined by `group_col`.
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

# ---- 3. Data loading ----

# Tip 6 : When importing data, it's a good idea to add a comment explaining the source of the data and the import method. 
# In addition, each data cleansing step should be accompanied by a comment explaining why it is necessary.

# Tip 7 : Use explicit variable names and avoid abbreviations. 
# Comment on analysis steps so others know what each line of code is trying to accomplish.

data <- data.frame(
  group = rep(c("A", "B", "C"), each = 10),
  value = c(rnorm(10, mean = 5), rnorm(10, mean = 10), rnorm(10, mean = 15))
)

# ---- 4. Exploration and analysis ----

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

# ---- 5. Saving results ----

# Save statistical summary
write_csv(resume, "resume_statistiques.csv")
cat("Statistical summary recorded under 'resume_statistiques.csv'\n")

# ---- 6. End of script ----
cat("Script successfully completed !\n")
