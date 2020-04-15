# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string
is_twice_as_long <- function(str1, str2) {
    answer <- "either string is not greater or equal to twice the length of the other"
    if (nchar(stmt1) >= 2 * nchar(stmt2)) {
        answer <- "one string is greater or equal to twice the length of the other"
    } if (2 * nchar(stmt1) <= nchar(stmt2)) {
        answer <- "one string is greater or equal to twice the length of the other"
    }
    return(answer)
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!
is_twice_as_long("hahahahaha", "haha")
is_twice_as_long("haha", "hahahahaha")
is_twice_as_long("haha", "haha")
is_twice_as_long("hahaha", "haha")

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"
describe_difference <- function(str1, str2) {
    diff <- abs(nchar(str1) - nchar(str2))
    if(nchar(str1) > nchar(str2)) {
        answer <- paste("Your first string is longer by", diff, "characters")
    } if(nchar(str1) < nchar(str2)) {
        answer <- paste("Your second string is longer by", diff, "characters")
    } else {
        answer <- "Your strings are the same length!"
    }
    return(answer)
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1

describe_difference("info", "informatics")
describe_difference("coding", "code")
describe_difference("Kyle", "Kyle")