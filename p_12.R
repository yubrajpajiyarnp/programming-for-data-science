

# function to take input
getinp <- function() {
  tem <- readline("Enter input: ")   # takes input as character
  return(tem)
}

# calling function and printing input
cat("Input is:", getinp(), "\n")

getfloat <- function() {
  repeat {
    x <- readline("Enter a number: ")
    num <- as.numeric(x)
    
    if (!is.na(num)) {
      return(num)
    } else {
      cat("Invalid input! Please enter a numeric value only.\n")
    }
  }
}

a <- getfloat()
print(a)
