# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!
names <- read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# Create a data frame `names_2013` that contains only the rows for the year 2013
names_2013 <- names[names$year == 2013, ]

# What was the most popular female name in 2013?
names_2013$name[names_2013$prop == max(names_2013$prop)]

# Write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year
most_popular_in_year <- function(y) {
  x <- names[names$year == y, ]
  answer <- x$name[x$prop == max(x$prop)]
  return(answer)
}

# What was the most popular female name in 1994?
most_popular_in_year(1994)
### Jessica

# Write a function `number_in_million` that takes in a name and a year, and 
# returns statistically how many babies out of 1 million born that year have 
# that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.
number_in_million <- function(n, y) {
  x <- names[names$year == y, ]
  answer <- length(x$name[x$name == n]) / length(x$name) * 1000000
  return(answer)
}

# How many babies out of 1 million had the name 'Laura' in 1995?
number_in_million("Laura", 1995)

# How many babies out of 1 million had your name in the year you were born?
number_in_million("Sofyar", 1999)

## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
#### Not too easy because I am a male. But it could also because I have an uncommon name.