# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_arr_delay_arpt <- flights %>% group_by(dest) %>%
  summarise(avg_arrival_dly = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(by = c("dest" = "faa"), y = airports) %>%
  filter(avg_arrival_dly == max(avg_arrival_dly, na.rm = TRUE))
## Columbia Metropolitan Airport
  
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
avg_arr_delay_arln <- flights %>% group_by(carrier) %>%
  summarise(avg_arrdelay = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airlines) %>%
  filter(avg_arrdelay == max(avg_arrdelay, na.rm = TRUE))
## Frontier Airlines