armstrongCheck <- function(num) {
  # Store original number for comparison
  original <- num
  
  # Count number of digits
  digitsCount <- nchar(as.character(num))
  
  sum <- 0
  
  # Process each digit
  while (num > 0) {
    digit <- num %% 10
    sum <- sum + (digit ^ digitsCount)
    num <- num %/% 10
  }
  
  # Check Armstrong condition
  if (sum == original) {
    return(paste(original, "is an Armstrong Number"))
  } else {
    return(paste(original, "is NOT an Armstrong Number"))
  }
}

# Testing the function
print(armstrongCheck(153))
print(armstrongCheck(370))
print(armstrongCheck(371))
print(armstrongCheck(9474))
print(armstrongCheck(123))
