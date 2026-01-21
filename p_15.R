#function to print fibonacci series upto n terms
fibonacci <- function(n) {
  if (n <= 0) {
    print("Enter a positive integer!")
    return()
  }
  
  a <- 0
  b <- 1
  i <- 1
  
  while (i <= n) {
    cat(a, " ")
    c <- a + b
    a <- b
    b <- c
    i <- i + 1
  }
}

# Example
fibonacci(11)
fibonacci(9)
}