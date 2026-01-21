leapYearCheck <- function(year) {
  # Leap year rule:
  # divisible by 400 OR (divisible by 4 but not by 100)
  
  if (year %% 400 == 0) {
    return(paste(year, "is a Leap Year"))
  } else if (year %% 4 == 0 && year %% 100 != 0) {
    return(paste(year, "is a Leap Year"))
  } else {
    return(paste(year, "is NOT a Leap Year"))
  }
}

# Testing with different inputs
print(leapYearCheck(2024))
print(leapYearCheck(2023))
print(leapYearCheck(2000))
print(leapYearCheck(1900))
