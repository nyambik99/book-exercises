# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library("dplyr")
flights <- nycflights13::flights

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
colnames(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- flights %>% mutate(lost_time = arr_delay - dep_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights <- arrange(flights, desc(lost_time))

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
flights <- flights %>% mutate(lost_time = arr_delay - dep_delay)
flights <- flights %>% arrange(desc(lost_time))

# Make a histogram of the amount of time gained using the `hist()` function
hist(flights$lost_time)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(flights$lost_time, na.rm = TRUE)
## on avg a flight gains time around 5.7 minutes

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
seattlebound <- flights %>% filter(dest == "SEA") %>%
  select(origin, dest, lost_time)

# On average, did flights to SeaTac gain or loose time?
mean(seattlebound$lost_time, na.rm = TRUE)
## gain time

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
jfk_to_sea <- flights %>%
  filter(origin == "JFK" & dest == "SEA") %>%
  select(air_time) %>%
  rbind(mean(air_time)) %>%
  filter(air_time == max(air_time, na.rm = TRUE) |
                      air_time == min(air_time, na.rm = TRUE) |
           air_time == mean(air_time, na.rm = TRUE))
