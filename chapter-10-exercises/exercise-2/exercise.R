# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employee <- c(paste("Employee", 1:100))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salary <- c(runif(100, min = 40000, max = 50000))

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
adjustment <- c(runif(100, min = -5000, max = 10000))

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employee, salary, adjustment, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$adjusted <- salary + adjustment

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- adjustment > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[57, 2]
# 45887.84

# How many employees got a raise?
length(salaries$raise[salaries$raise == TRUE])

# What was the dollar value of the highest raise?
max(salaries$adjustment)
# 9857.903

# What was the "name" of the employee who received the highest raise?
salaries[salaries$adjustment > 9857.903, 1]

# What was the largest decrease in salaries between the two years?
min(salaries$adjustment)
# -4906.236

# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$adjustment < -4906, 1]
# Employee 99

# What was the average salary change?
mean(salaries$adjustment)
# 2233.542

# For people who did not get a raise, how much money did they lose on average?
mean(salaries$adjustment[adjustment < 0])
# -2517.779

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
# yes

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "10-2 Exercise", row.names = FALSE)
